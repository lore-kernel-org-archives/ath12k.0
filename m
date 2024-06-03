Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C147C25B76
	for <ath12k@archiver.kernel.org>; Mon,  3 Jun 2024 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MX7bhPDpyoRoQtgN30Y8zQVJv0ZI59dtVj8MaYOZzjY=; b=lR/S5nTQ92371yRM2q+Hkwl3CU
	u1sxRo7mctLd0AV2St2Xp40i69O838+NEebcHCicskslku0H4igpsJTmmi8w/AIyt6PevBBX4AFiF
	tU2wDdY7YR6hIPyQVk9neGZke6yScdA4YiCqFJZ007AcYcAXVHDSO3ug8Om1mr0Qf2nC0MbjoGR6l
	bhOKSKptjFoksR6BjDZ7ku1UlE6VoyNmj+gYnJtoIJl/u0B+lJ2RvCgNf2uc+QzAYqq9xebo1jFls
	SGoRFUkGmc4Lu34Eeivr+/1uQEJbo5z4JeC3ytaqmNbxIGs2NP3U33wwUmTeHZMm25WF9pa50wy/m
	D2njEYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE8Ql-0000000H1Yj-2OQ6
	for ath12k@archiver.kernel.org;
	Mon, 03 Jun 2024 14:12:59 +0000
Received: from mail33c25.carrierzone.com ([64.29.147.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE8Qg-0000000H1XE-3VYM
	for ath12k@lists.infradead.org;
	Mon, 03 Jun 2024 14:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
	s=mailmia; t=1717423966;
	bh=MX7bhPDpyoRoQtgN30Y8zQVJv0ZI59dtVj8MaYOZzjY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:Reply-to:From;
	b=qvfoUrf8TdIjutwNlHndklo7yuXdHGfrFTGp9up3buPXorMSW07tLZD5HIejufeyr
	 pOR3EG1HJWvkHQZ/2cMe+bluuLm0JaYKMcH5pgzfS4ahCWZ1mpO9bvVlXy8g9mkOTa
	 KP8hEs9I2xhk4KFX5ldUrp1Plf9uPfjv+SFHqEfs=
Feedback-ID: pgupta@hindutoo
Received: from mail33c25.carrierzone.com (localhost [127.0.0.1])
	by mail33c25.carrierzone.com (8.14.9/8.13.1) with ESMTP id 453ECfms013809
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Jun 2024 14:12:41 +0000
Received: (from webmail@localhost)
	by mail33c25.carrierzone.com (8.14.9/8.12.2/Submit) id 453ECf3Y013729;
	Mon, 3 Jun 2024 10:12:41 -0400
From: "pgupta@hindutool.com" <pgupta@hindutool.com>
To: quic_vthiagar@quicinc.com, quic_hprem@quicinc.com,
        quic_jjohnson@quicinc.com, quic_bqiang@quicinc.com,
        ath12k@lists.infradead.org
CC: linux-wireless@vger.kernel.org
Subject: Re: [PATCH v7 0/8] wifi: ath12k: Introduce device group abstraction
Date: Mon, 03 Jun 2024 10:12:41 -0400
Message-ID: <1717423961.zxh2nipscocc4sk0@mailapp03.register.com>
In-Reply-To: <3453b0f2-6cf8-8377-127e-77f955593d3b@quicinc.com>
References: <20240528063547.1400700-1-quic_hprem@quicinc.com>
 <396d645d-6f3b-4c1b-9d4b-d056fad36192@quicinc.com>
 <7b92a6cd-187d-4b6d-8cfb-af54365751fc@quicinc.com>
 <d7898dd9-b3d2-45a1-8581-41d16b900a27@quicinc.com>
 <cc0fdf88-7046-eb93-265b-35a2d7299952@quicinc.com>
 <1717161560.nw3mokq68g8og484@mailapp03.register.com>
 <3453b0f2-6cf8-8377-127e-77f955593d3b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Image-Url: https://mailapp03.register.com/api/storage/pgupta@hindutool.com/profile/picture
X-VADE-SPAMSTATE: clean
X-VADE-SPAMSCORE: 40
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvdelvddgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffquffvqffrkfetpdfqfgfvpdfgpfggqdevvdehnecuuegrihhlohhuthemuceftddunecuogfuohhrthgvugftvggtihhpvdculdegtddmnecujfgurhephffvvefufffkjghfgggtgfhrsehtqhertddttdejnecuhfhrohhmpedfphhguhhpthgrsehhihhnughuthhoohhlrdgtohhmfdcuoehpghhuphhtrgeshhhinhguuhhtohholhdrtghomheqnecuggftrfgrthhtvghrnheptedtvdeiteekgeduheeitefhueekheetffethfdvjeffieejvdevvedvtedvgeehnecukfhppeduvdejrddtrddtrddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddphhgvlhhopehmrghilheffegtvdehrdgtrghrrhhivghriihonhgvrdgtohhmpdhmrghilhhfrhhomhepphhguhhpthgrsehhihhnughuthhoohhlrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheplhhinhhugidqfihirhgvlhgvshhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghthhduvdhksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepqhhuihgtpggsqhhirghnghesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehquhhitggpjhhjohhhnhhsohhnsehquhhitghinhgtrdgtohhmpdhrtgh!
 pthhtohepqhhuihgtpghhphhrvghmsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghvthhhihgrghgrrhesqhhuihgtihhntgdrtghomh
X-Rspamd-Result: default: False [0.90 / 6.00];
	FROM_DN_EQ_ADDR(1.00)[];
	MIME_GOOD(-0.10)[text/plain];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_REPLYTO(0.00)[pgupta@hindutool.com];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Status: No, score=0.90
X-Origin-Country: Unknown
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_071255_237594_E40DC4D8 
X-CRM114-Status: GOOD (  24.92  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: pgupta@hindutool.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Thank you for your reply. I have passed this information along to my board =
manufacturer (Compex) and we are currently working on a solution for the at=
h12k failing to recognize my module in the board-2.bin


Prashant

On Mon, 3 Jun 2024 10:33:09 +0530, Vasanthakumar Thiagarajan <quic_vthiagar=
@quicinc.com> wrote:

>> On 5/31/2024 6:49 PM, pgupta@hindutool.com wrote:
>> > Is there a limit to the number of hardware abstraction layers?
>>
>> Please note that grouping multiple hardware under one wiphy is still not=
 supported in
>> ath12k. This patch series is a strep towards such architecture. When the=
 full hardware
>> grouping support is added, there will not be any restrictions in the num=
ber of hardware
>> which can be be grouped under only wiphy.
>>
>> My current platform has 3 physical WiFi 7 modules in one machine - one f=
or each
>> frequency 2.4 GHz, 5 GHz, and 6GHz. Is this currently not supported?
>>
>> This should work with ath12k as all three will be registered as three di=
fferent wiphys.
>>
>> > What if I want to connect more than 3 modules including identical modu=
les of the same frequency? My setup will not be utilizing combined frequenc=
y modules.
>>
>> Grouping hardware having same frequency capability will make things very=
 complex, I dont
>> think it is worthy of the effort especially there is no obvious real use=
 case to combine
>> such radios under one wiphy.
>>
>> > FYI, in my platform, each module is connected to its own PCIe slot, an=
d has its own antennas so I assume it would be recognized as its own wirele=
ss device by the OS (i.e wlan0, wlan1, wlan2, etc.).
>> >
>>
>> Yes, each hardware will be registered as separate phy and wlan
>> interfaces with respective capability can be created on top of
>> them.
>>
>> Vasanth
>>
>>
>> >
>> > On Fri, 31 May 2024 15:35:24 +0530, Harshitha Prem wrote:
>> >
>> >>> On 5/30/2024 3:58 AM, Jeff Johnson wrote:
>> >>>> On 5/28/2024 8:13 PM, Baochen Qiang wrote:
>> >>>>>
>> >>>>>
>> >>>>> On 5/29/2024 6:04 AM, Jeff Johnson wrote:
>> >>>>>> On 5/27/2024 11:35 PM, Harshitha Prem wrote:
>> >>>>>>> To support multi-link operation, multiple devices with different=
 bands say
>> >>>>>>> 2 GHz or 5 GHz or 6 GHz can be combined together as a group and =
provide
>> >>>>>>> an abstraction to mac80211.
>> >>>>>>>
>> >>>>>>> Device group abstraction - when there are multiple devices that =
are
>> >>>>>>> connected by any means of communication interface between them, =
then these
>> >>>>>>> devices can be combined together as a single group using a group=
 id to form
>> >>>>>>> a group abstraction. In ath12k driver, this abstraction would be=
 named as
>> >>>>>>> ath12k_hw_group (ag).
>> >>>>>>>
>> >>>>>>> Please find below illustration of device group abstraction with =
two
>> >>>>>>> devices.
>> >>>>>>>
>> >>>>>>> Grouping of multiple devices (in future)
>> >>>>>>> +---------------------------------------------------------------=
---------+
>> >>>>>>> | +-------------------------------------+ +-------------------+ =
|
>> >>>>>>> | | +-----------+ | | +-----------+ | | +-----------+ | |
>> >>>>>>> | | | ar (2GHz) | | | | ar (5GHz) | | | | ar (6GHz) | | |
>> >>>>>>> | | +-----------+ | | +-----------+ | | +-----------+ | |
>> >>>>>>> | | ath12k_base (ab) | | ath12k_base (ab) | |
>> >>>>>>> | | (Dual band device) | | | |
>> >>>>>>> | +-------------------------------------+ +-------------------+ =
|
>> >>>>>>> | ath12k_hw_group (ag) based on group id |
>> >>>>>>> +---------------------------------------------------------------=
---------+
>> >>>>>>>
>> >>>>>>> Say for example, device 1 has two radios (2 GHz and 5 GHz band) =
and
>> >>>>>>> device 2 has one radio (6 GHz).
>> >>>>>>>
>> >>>>>>> In existing code -
>> >>>>>>> device 1 will have two hardware abstractions hw1 (2 GHz) and hw2
>> >>>>>>> (5 GHz) will be registered separately to mac80211 as phy0 and ph=
y1
>> >>>>>>> respectively. Similarly, device 2 will register its hw (6GHz) as
>> >>>>>>> phy2 to mac80211.
>> >>>>>>>
>> >>>>>>> In future, with multi-link abstraction
>> >>>>>>>
>> >>>>>>> combination 1 - Different group id for device1 and device 2
>> >>>>>>> Device 1 will create a single hardware abstraction hw1
>> >>>>>>> (2 GHz and 5 GHz) and will be registered to mac80211 as
>> >>>>>>> phy0. similarly, device 2 will register its hardware
>> >>>>>>> (6 GHz) to mac80211 as phy1.
>> >>>>>>>
>> >>>>>>> combination 2 - Same group id for device1 and device 2
>> >>>>>>> Both device details are combined together as a group, say
>> >>>>>>> group1, with single hardware abstraction of radios 2 GHz,
>> >>>>>>> 5 GHz and 6 GHz band details and will be registered to
>> >>>>>>> mac80211 as phy0.
>> >>>>>>>
>> >>>>>>> Add base infrastructure changes to add device grouping abstracti=
on with
>> >>>>>>> a single device.
>> >>>>>>>
>> >>>>>>> This patch series brings the base code changes with following or=
der:
>> >>>>>>> 1. Refactor existing code which would facilitate in introducing
>> >>>>>>> device group abstraction.
>> >>>>>>> 2. Create a device group abstraction during device probe.
>> >>>>>>> 3. Start the device group only after QMI firmware ready event is
>> >>>>>>> received for all the devices that are combined in the group.
>> >>>>>>> 4. Move the hardware abstractions (ath12k_hw - ah) from device
>> >>>>>>> (ath12k_base - ab) to device group abstraction (ag) as it would
>> >>>>>>> ease in having different combinations of group abstraction that
>> >>>>>>> can be registered to mac80211.
>> >>>>>>>
>> >>>>>>> v7:
>> >>>>>>> - Added linux-wireless mailer to cc.
>> >>>>>>> - Removed Acked-by tag from "[PATCH v6 8/8]" as it has minor cha=
nge.
>> >>>>>>>
>> >>>>>>> v6:
>> >>>>>>> - Addressed smatch error seen on "[PATCH v5 8/8] wifi: ath12k: m=
ove
>> >>>>>>> ath12k_hw from per soc to group"
>> >>>>>>> - Rebased to ToT
>> >>>>>>> v5:
>> >>>>>>> - on "[PATCH 8/8] wifi: ath12k: move ath12k_hw from per soc to
>> >>>>>>> group", refactor the ath12k_mac_hw_allocate() api based on ag ra=
ther
>> >>>>>>> than ab and update hardware abstraction array size in ath12k_hw_=
group
>> >>>>>>> as ATH12K_GROUP_MAX_RADIO.
>> >>>>>>> - Rebased to ToT
>> >>>>>>> v4:
>> >>>>>>> - Modified the cover letter
>> >>>>>>> v3:
>> >>>>>>> - Removed depends-on tag of "wifi: ath12k: Refactor the hardware=
 recovery
>> >>>>>>> procedures" as it is merged to ToT
>> >>>>>>> - Addressed the deadlock warning seen during rmmod.
>> >>>>>>>
>> >>>>>>> v2:
>> >>>>>>> - Rebased to ToT
>> >>>>>>>
>> >>>>>>> Karthikeyan Periyasamy (8):
>> >>>>>>> wifi: ath12k: Refactor core start api
>> >>>>>>> wifi: ath12k: Add helpers to get or set ath12k_hw
>> >>>>>>> wifi: ath12k: Add ath12k_get_num_hw api
>> >>>>>>> wifi: ath12k: Introduce QMI firmware ready flag
>> >>>>>>> wifi: ath12k: move ATH12K_FLAG_REGISTERED flag set to mac_regist=
er api
>> >>>>>>> wifi: ath12k: Introduce device group abstraction
>> >>>>>>> wifi: ath12k: refactor core start based on hardware group
>> >>>>>>> wifi: ath12k: move ath12k_hw from per device to group
>> >>>>>>>
>> >>>>>>> drivers/net/wireless/ath/ath12k/core.c | 431 +++++++++++++++++++=
++----
>> >>>>>>> drivers/net/wireless/ath/ath12k/core.h | 87 ++++-
>> >>>>>>> drivers/net/wireless/ath/ath12k/dp.c | 19 +-
>> >>>>>>> drivers/net/wireless/ath/ath12k/dp.h | 2 +-
>> >>>>>>> drivers/net/wireless/ath/ath12k/mac.c | 117 ++++---
>> >>>>>>> drivers/net/wireless/ath/ath12k/mac.h | 9 +-
>> >>>>>>> drivers/net/wireless/ath/ath12k/pci.c | 2 +
>> >>>>>>> drivers/net/wireless/ath/ath12k/qmi.c | 10 +-
>> >>>>>>> 8 files changed, 544 insertions(+), 133 deletions(-)
>> >>>>>>>
>> >>>>>>>
>> >>>>>>> base-commit: f8320064a28242448eeb9fece08abd865ea8a226
>> >>>>>>
>> >>>>>> With this series I'm seeing a firmware crash upon resume from hib=
ernation, but
>> >>>>>> I'm not sure if it is the same intermittent crash I reported in a=
nother thread
>> >>>>>> where firmware is not correctly handling a low physical memory ad=
dress.
>> >>>>>>
>> >>>>>> Baochen & Kalle, since this issue may be specific to my laptop, c=
an you
>> >>>>>> validate hibernation on your setups?
>> >>>>> I can also see a firmware crash upon resume. I am using ath-202405=
281746 as code base.
>> >>>>
>> >>>> I bisected to:
>> >>>> [PATCH v7 7/8] wifi: ath12k: refactor core start based on hardware =
group
>> >>>>
>> >>>>
>> >>> Thank you so much, Jeff. Identified the possible reason that is caus=
ing
>> >>> the firmware assert with hibernation scenario and will address it in
>> >>> next version.
>> >

