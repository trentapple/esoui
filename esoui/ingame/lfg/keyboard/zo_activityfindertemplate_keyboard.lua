local GROUP_SIZE_ICON_FORMAT = zo_iconFormat("EsoUI/Art/LFG/LFG_icon_groupSize.dds", 32, 32)

------------------
--Initialization--
------------------

ZO_ActivityFinderTemplate_Keyboard = ZO_ActivityFinderTemplate_Shared:Subclass()

function ZO_ActivityFinderTemplate_Keyboard:New(...)
    return ZO_ActivityFinderTemplate_Shared.New(self, ...)
end

function ZO_ActivityFinderTemplate_Keyboard:Initialize(dataManager, categoryData)
    local control = CreateControlFromVirtual(dataManager:GetName() .. "_Keyboard", GuiRoot, "ZO_ActivityFinderTemplateTopLevel_Keyboard")
    ZO_ActivityFinderTemplate_Shared.Initialize(self, control, dataManager, categoryData)
end

function ZO_ActivityFinderTemplate_Keyboard:InitializeControls()
    self.listSection = self.control:GetNamedChild("ListSection")
    self.lfmPromptSection = self.control:GetNamedChild("LFMPromptSection")
    self.lfmPromptBodyLabel = self.lfmPromptSection:GetNamedChild("Body")

    self.filterControl = self.control:GetNamedChild("Filter")
    self.joinQueueButton = self.control:GetNamedChild("QueueButton")
    self.lockReasonLabel = self.control:GetNamedChild("LockReason")

    local function OnLockReasonLabelUpdate()
        if self.lockReasonTextFunction then
            self.lockReasonLabel:SetText(zo_iconTextFormat("EsoUI/Art/Miscellaneous/locked_disabled.dds", 16, 16, self.lockReasonTextFunction()))
        end
    end
    self.lockReasonLabel:SetHandler("OnUpdate", OnLockReasonLabelUpdate)

    ZO_ActivityFinderTemplate_Shared.InitializeControls(self, "ZO_ActivityFinderTemplateRewardTemplate_Keyboard")
    
    self:InitializeNavigationList()
end

function ZO_ActivityFinderTemplate_Keyboard:InitializeFilters()
    local filterComboBox = ZO_ComboBox_ObjectFromContainer(self.filterControl)
    filterComboBox:SetSortsItems(false)
    filterComboBox:SetFont("ZoFontWinT1")
    filterComboBox:SetSpacing(4)
    self.filterComboBox = filterComboBox
    self:RefreshFilters()
end

function ZO_ActivityFinderTemplate_Keyboard:InitializeNavigationList()
    self.navigationTree = ZO_Tree:New(self.listSection:GetNamedChild("ScrollChild"), 60, -10, 600)

    local openTexture = "EsoUI/Art/Buttons/tree_open_up.dds"
    local closedTexture = "EsoUI/Art/Buttons/tree_closed_up.dds"
    local overOpenTexture = "EsoUI/Art/Buttons/tree_open_over.dds"
    local overClosedTexture = "EsoUI/Art/Buttons/tree_closed_over.dds"

    local function TreeHeaderSetup(node, control, name, open)
        control.text:SetModifyTextType(MODIFY_TEXT_TYPE_UPPERCASE)
        control.text:SetText(name)

        control.icon:SetTexture(open and openTexture or closedTexture)
        control.iconHighlight:SetTexture(open and overOpenTexture or overClosedTexture)

        local ENABLED = true
        local DISABLE_SCALING = true
        ZO_IconHeader_Setup(control, open, ENABLED, DISABLE_SCALING)
    end
    
    local function TreeEntrySetup(node, control, data, open)
        control.text:SetText(data:GetNameKeyboard())
        local isLocked = data:IsLocked()
        control.enabled = not isLocked and not IsCurrentlySearchingForGroup()
        control.check:SetHidden(isLocked)
        control.lockIcon:SetHidden(not isLocked)
        control.text:SetEnabled(control.enabled)

        if not isLocked then
            ZO_CheckButton_SetCheckState(control.check, data:IsSelected())
        end
    end

    self.navigationTree:AddTemplate("ZO_ActivityFinderTemplateNavigationHeader_Keyboard", TreeHeaderSetup, nil, nil, nil, 0)

    local function TreeEntryEquality(left, right)
        return left.name == right.name
    end

    self.navigationTree:AddTemplate("ZO_ActivityFinderTemplateNavigationEntry_Keyboard", TreeEntrySetup, nil, TreeEntryEquality)
    self.navigationTree:SetOpenAnimation("ZO_TreeOpenAnimation")
end

function ZO_ActivityFinderTemplate_Keyboard:InitializeFragment()
    local function OnStateChange(oldState, newState)
        if newState == SCENE_FRAGMENT_SHOWN then
            local shouldShowLFMPrompt, lfmPromptActivityName = self:GetLFMPromptInfo()
            if shouldShowLFMPrompt then
                self.lfmPromptBodyLabel:SetText(zo_strformat(GetString(SI_LFG_FIND_REPLACEMENT_TEXT), lfmPromptActivityName))
                self.lfmPromptSection:SetHidden(false)
                self:HidePrimaryControls()
            end

            self:RefreshView()
        end
    end
    self.fragment = ZO_FadeSceneFragment:New(self.control)
    self.fragment:RegisterCallback("StateChange", OnStateChange)
    self.categoryData.categoryFragment = self.fragment

    GROUP_MENU_KEYBOARD:AddCategory(self.categoryData)
end

function ZO_ActivityFinderTemplate_Keyboard:RegisterEvents()
    ZO_ActivityFinderTemplate_Shared.RegisterEvents(self)
    ZO_ACTIVITY_FINDER_ROOT_MANAGER:RegisterCallback("OnSelectionsChanged", function(...) self:RefreshJoinQueueButton(...) end)
end

-----------
--Updates--
-----------

function ZO_ActivityFinderTemplate_Keyboard:RefreshView()
    if not self.fragment:IsShowing() then
        return
    end
    
    local shouldShowLFMPrompt = self:GetLFMPromptInfo()
    if not shouldShowLFMPrompt then
        self:ResetLFMPrompt()
    end

    local lockReasonText

    local selectedData = self.filterComboBox:GetSelectedItemData()
    if selectedData then
        local filterData = selectedData.data
        if filterData.singular then
            local activityType = filterData:GetActivityType()
            if filterData:GetEntryType() == ZO_ACTIVITY_FINDER_LOCATION_ENTRY_TYPE.RANDOM then
                ZO_ACTIVITY_FINDER_ROOT_MANAGER:SetActivityTypeSelected(activityType, true)
                lockReasonText = ZO_ACTIVITY_FINDER_ROOT_MANAGER:GetLockReasonForActivityType(activityType)
            else
                ZO_ACTIVITY_FINDER_ROOT_MANAGER:SetLocationSelected(filterData, true)
                if filterData:IsLocked() then
                    lockReasonText = filterData:GetLockReasonText()
                end
            end
        else
            self.navigationTree:Reset()

            ZO_ACTIVITY_FINDER_ROOT_MANAGER:RebuildSelections(filterData.activityTypes)

            local modes = self.dataManager:GetFilterModeData()

            local HEADER_OPEN = true
            for activityIndex, activityType in ipairs(filterData.activityTypes) do
                if ZO_ACTIVITY_FINDER_ROOT_MANAGER:GetNumLocationsByActivity(activityType, modes:GetVisibleEntryTypes()) > 0 then
                    local isLocked = self:GetLevelLockInfoByActivity(activityType)
                    if not isLocked then
                        local locationData = ZO_ACTIVITY_FINDER_ROOT_MANAGER:GetLocationsData(activityType)
                        local headerText = GetString("SI_LFGACTIVITY", activityType)
                        local headerNode = self.navigationTree:AddNode("ZO_ActivityFinderTemplateNavigationHeader_Keyboard", headerText, nil, SOUNDS.JOURNAL_PROGRESS_CATEGORY_SELECTED, HEADER_OPEN)

                        for locationIndex, location in ipairs(locationData) do
                            if modes:IsEntryTypeVisible(location:GetEntryType()) then
                                self.navigationTree:AddNode("ZO_ActivityFinderTemplateNavigationEntry_Keyboard", location, headerNode, SOUNDS.JOURNAL_PROGRESS_SUB_CATEGORY_SELECTED)
                            end
                        end
                    end
                end
            end

            self.navigationTree:Commit()
        end
    end

    local globalLockReasonText = self:GetGlobalLockText()

    if globalLockReasonText then
        lockReasonText = globalLockReasonText
    end

    if lockReasonText then
        --if the text is a function, that means there's a timer involved that we want to refresh on update
        if type(lockReasonText) == "function" then
            self.lockReasonTextFunction = lockReasonText
        else
            self.lockReasonLabel:SetText(zo_iconTextFormat("EsoUI/Art/Miscellaneous/locked_disabled.dds", 16, 16, lockReasonText))
            self.lockReasonTextFunction = nil
        end
        self.lockReasonLabel:SetHidden(false)
    else
        self.lockReasonLabel:SetHidden(true)
    end

    self:RefreshJoinQueueButton()
end

function ZO_ActivityFinderTemplate_Keyboard:RefreshFilters()
    local function OnFilterChanged(...)
        self:OnFilterChanged(...)
    end

    local previousSelection = self.filterComboBox:GetSelectedItemData()
    local reselectedEntry = nil
    self.filterComboBox:ClearItems()

    local modes = self.dataManager:GetFilterModeData()
    local activityTypes = modes:GetActivityTypes()
    --Add potential randoms
    for _, activityType in ipairs(activityTypes) do
        local randomInfo = modes:GetRandomInfo(activityType)
        if randomInfo and DoesLFGActivityHasAllOption(activityType) then
            local isLocked = self:GetLevelLockInfoByActivity(activityType)
            if not isLocked then
                local randomLocationData = ZO_ActivityFinderLocation_Random:New(activityType, randomInfo)
                randomLocationData.singular = true
                local entry = ZO_ComboBox:CreateItemEntry(randomLocationData:GetNameKeyboard(), OnFilterChanged)
                entry.data = randomLocationData

                if previousSelection and previousSelection.name == entry.name then
                    reselectedEntry = entry
                end
                self.filterComboBox:AddItem(entry, ZO_COMBOBOX_SUPRESS_UPDATE)
            end
        end
    end
    
    --Add specifics
    if modes:AreEntriesInSubmenu() then
        local entry = ZO_ComboBox:CreateItemEntry(modes:GetSpecificFilterName(), OnFilterChanged)
        entry.data =
        {
            singular = false,
            activityTypes = activityTypes,
        }

        if previousSelection and previousSelection.name == entry.name then
            reselectedEntry = entry
        end

        self.filterComboBox:AddItem(entry, ZO_COMBOBOX_SUPRESS_UPDATE)
    else
        for _, activityType in ipairs(activityTypes) do
            local locationData = ZO_ACTIVITY_FINDER_ROOT_MANAGER:GetLocationsData(activityType)
            for _, location in ipairs(locationData) do
                local entry = ZO_ComboBox:CreateItemEntry(location:GetNameKeyboard(), OnFilterChanged)
                location.singular = true
                entry.data = location

                if previousSelection and previousSelection.name == entry.name then
                    reselectedEntry = entry
                end

                self.filterComboBox:AddItem(entry, ZO_COMBOBOX_SUPRESS_UPDATE)
            end
        end
    end

    if reselectedEntry then
        local IGNORE_CALLBACK = false
        self.filterComboBox:SelectItem(reselectedEntry, IGNORE_CALLBACK)
    else
        self.filterComboBox:SelectFirstItem()
    end

    self.filterControl:SetHidden(self.filterComboBox:GetNumItems() <= 1)
end

function ZO_ActivityFinderTemplate_Keyboard:RefreshJoinQueueButton()
    self.joinQueueButton:SetEnabled(ZO_ACTIVITY_FINDER_ROOT_MANAGER:IsAnyLocationSelected() and not ZO_ACTIVITY_FINDER_ROOT_MANAGER:GetIsCurrentlyInQueue())
end

----------
--Events--
----------

function ZO_ActivityFinderTemplate_Keyboard:OnFilterChanged(comboBox, entryText, entry)
    ZO_ACTIVITY_FINDER_ROOT_MANAGER:ClearSelections()

    local data = entry.data
    self.singularSection:SetHidden(not data.singular)
    self.listSection:SetHidden(data.singular)

    if data.singular then
        self.titleLabel:SetText(data:GetNameKeyboard())
        self.descriptionLabel:SetText(data:GetDescription())
        self.backgroundTexture:SetTexture(data:GetDescriptionTextureLargeKeyboard())
        data:SetGroupSizeRangeText(self.groupSizeRangeLabel, GROUP_SIZE_ICON_FORMAT)

        self:RefreshRewards(data)
    end

    self:RefreshView()
end

function ZO_ActivityFinderTemplate_Keyboard:OnActivityFinderStatusUpdate()
    self:RefreshView()
end

function ZO_ActivityFinderTemplate_Keyboard:OnCooldownsUpdate()
    local selectedData = self.filterComboBox:GetSelectedItemData()
    if selectedData then
        local filterData = selectedData.data
        if filterData.singular then
            self:RefreshRewards(filterData)
        end
    end
end

function ZO_ActivityFinderTemplate_Keyboard:ShowPrimaryControls()
    self.filterControl:SetHidden(false)
    self.joinQueueButton:SetHidden(false)
    local filterData = self.filterComboBox:GetSelectedItemData().data
    if filterData.singular then
        self.singularSection:SetHidden(false)
        self.lockReasonLabel:SetHidden(false)
    else
        self.listSection:SetHidden(false)
    end
end

function ZO_ActivityFinderTemplate_Keyboard:HidePrimaryControls()
    self.singularSection:SetHidden(true)
    self.listSection:SetHidden(true)
    self.filterControl:SetHidden(true)
    self.joinQueueButton:SetHidden(true)
    self.lockReasonLabel:SetHidden(true)
end

function ZO_ActivityFinderTemplate_Keyboard:ResetLFMPrompt()
    if not self.lfmPromptSection:IsHidden() then
        self.lfmPromptSection:SetHidden(true)
        self:ShowPrimaryControls()
    end
end

function ZO_ActivityFinderTemplate_Keyboard:OnHandleLFMPromptResponse()
    if self.fragment:IsShowing() then
        self:ResetLFMPrompt()
    end
end

-------------
--Accessors--
-------------

function ZO_ActivityFinderTemplate_Keyboard:GetFragment()
    return self.fragment
end

----------
--Layout--
----------

function ZO_ActivityFinderTemplate_Keyboard.ShowActivityTooltip(control)
    local data = control.node.data
    local tooltip = ZO_ActivityFinderTemplateTooltip_Keyboard
    InitializeTooltip(tooltip, control, TOPRIGHT, -70, 0, TOPLEFT)
    
    local tooltipContents = tooltip:GetNamedChild("Contents")
    local groupSizeLabel = tooltipContents:GetNamedChild("GroupSizeLabel")
    data:SetGroupSizeRangeText(groupSizeLabel, GROUP_SIZE_ICON_FORMAT)
        
    local nameLabel = tooltipContents:GetNamedChild("NameLabel")
    nameLabel:SetText(data.nameKeyboard)

    local artTexture = tooltip:GetNamedChild("ArtTexture")
    artTexture:SetTexture(data.descriptionTextureSmallKeyboard)

    local lockedInfoLabel = tooltipContents:GetNamedChild("LockedInfoLabel")
    if data.isLocked then
        lockedInfoLabel:SetHidden(false)
        lockedInfoLabel:SetColor(ZO_ERROR_COLOR:UnpackRGBA())
        lockedInfoLabel:SetText(zo_iconTextFormat("EsoUI/Art/Miscellaneous/locked_disabled.dds", 16, 16, data.lockReasonText))
    else
        lockedInfoLabel:SetHidden(true)
    end

    local setTypesSectionControl = tooltipContents:GetNamedChild("SetTypesSection")
    ZO_ActivityFinderTemplate_Shared.AppendSetDataToTooltip(setTypesSectionControl, data)
end

function ZO_ActivityFinderTemplate_Keyboard.HideActivityTooltip()
    ClearTooltip(ZO_ActivityFinderTemplateTooltip_Keyboard)
end

----------------
--Global Hooks--
----------------

function ZO_ActivityFinderTemplateNavigationEntryKeyboard_OnClicked(control, button)
    if control.enabled then
        ZO_CheckButton_OnClicked(control.check)
        ZO_ACTIVITY_FINDER_ROOT_MANAGER:ToggleLocationSelected(control.node.data)
    end
end

function ZO_ActivityFinderTemplateNavigationEntryKeyboard_OnMouseEnter(control)
    if control.enabled then
        ZO_SelectableLabel_OnMouseEnter(control.text)
        control.check:SetShowingHighlight(true)
    end
    ZO_ActivityFinderTemplate_Keyboard.ShowActivityTooltip(control)
end

function ZO_ActivityFinderTemplateNavigationEntryKeyboard_OnMouseExit(control)
    if control.enabled then
        ZO_SelectableLabel_OnMouseExit(control.text, false)
        control.check:SetShowingHighlight(false)
    end
    ZO_ActivityFinderTemplate_Keyboard.HideActivityTooltip()
end

function ZO_ActivityFinderTemplateQueueButtonKeyboard_OnClicked(control)
    if not IsCurrentlySearchingForGroup() then
        ZO_ACTIVITY_FINDER_ROOT_MANAGER:StartSearch()
    end
end

function ZO_ActivityFinderTemplateNavigationEntryKeyboard_OnInitialized(control)
    control.lockIcon = control:GetNamedChild("LockIcon")
    control.check = control:GetNamedChild("Check")
    control.text = control:GetNamedChild("Text")
    local fontHeight = control.text:GetFontHeight()
    control:SetDimensionConstraints(0, fontHeight, 0, 0)
end