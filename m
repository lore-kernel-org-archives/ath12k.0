Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF19606A321
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 01:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tYPf97Xi;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IZoz4xhr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ALqkE1Wp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9UvrlVxmAVHO3cEaHfpxSeEvyt+RONCD7RCf3riDDPY=; b=tYPf97Xi4aAadx
	fdAk2hfGug38I+mgSBbxU1WZV9rHQz8zJP+2N9pECH+h6H5Z99RAbazerK0waM/7G9Pi3iZ6DBJSh
	fxF4WEUGJY87yMXAkMkHS/nALBIVXi9mk3nCTSGuww12kQFHcl7vE5SyLbJkTdNAmSQ7zhPoRf7GM
	bHYYLG451N81zxO/bbSBIu/1rTwlFFbR8KeB8quYH0C8IRy0PvLDYVSv/yjGhRnlM7rrASRaAA3SX
	0ax7qQ/zq9x10gkzQF/tIAhpVGUH2IprjJ22obvsYZv+PT1uBoEDOWbjswZ7lMWUGSRuxITUf0Ldy
	dAhIXkzdesD/88r7zSHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfoE-00000005Lb7-0TWK;
	Tue, 24 Nov 2026 01:59:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfoC-00000005Lai-0E28
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 01:59:01 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO0M6Rb3818148
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 01:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9UvrlVxmAVHO3cEaHfpxSeEvyt+RONCD7RCf3riDDPY=; b=IZoz4xhr8g1uVQEl
	6TWNmr67vbavrVBS14NiIfS/vAMuiMDji3n0juJQSsRWcSy6XmBF0Vvgh1nQBzWC
	TNxkkDRI9zd6o18r+oGN+lDFe06ln10EOK3IE4YmLCC6ja2sVdY+ETEd3aRvPwFj
	SmSMW059QC9XDIut8Wia334kKxLFPqHf7uPmvgW2VTOL0k9UmnKEc5dp8zmJRJiM
	aQvkrE9ViNUYOF/pbafcENuKueGiycJnQphKUqaVrlS0LswQj2xhbCSmFEFdF4oX
	OeaZ1ubXtHpXr801rcgVfCbYifZoQjit+6ZxvFwz15Mekff+RYr2Gzwbf5/qTHgW
	/fAwEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt08k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 01:58:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0ac2d8225so8959145ad.3
        for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 17:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795485538; x=1796090338; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9UvrlVxmAVHO3cEaHfpxSeEvyt+RONCD7RCf3riDDPY=;
        b=ALqkE1Wpq+rBa4IcBCqC1GRdqshdefxx4yBG208s/FUIhUIzWavhkrzArb5h7DXojs
         UcwC0OxLf7ec4Z2TNX18idoaSMhKQRyiia9eCWY/8gCvrGSKQH0FEj6W/OUuhJMRbKid
         Q9+OpT/8OPB8A8OrPcuqvcII/tmcPmaInQdxejEwsBMDbAKnJI3PkQMzg+9sKkwNxYD5
         QjBrRzCGph98hFYYpxQ06vhfYB/7g63Oft1qcOjCSkZAMSgERV/MPoDH9oLag1kkL8Jr
         FNxoe5GrHCLy8mMZ5W6sLg0Lv1qI9jEqWbreDruxqQMmGMHqUgJfZVkUd04A1wImKyvX
         8zvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485538; x=1796090338;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UvrlVxmAVHO3cEaHfpxSeEvyt+RONCD7RCf3riDDPY=;
        b=mv8mUwgK7e1otGAtwbD13p/alxC4j6L7Lq4utDL7dk4rGy3mzUCQHbUYp987/ErX2S
         cRbsdKQfWdMW0/OINfhE3fFEL/XDzmrkjZK0L3KSr78DmcrP/cwVA2qZyzxPnpp2LncM
         Mb13LWiNFwzF88Ak6La15WF4IdVcSRz8L6fcOZCr/qBukD41AKzJR+Ew1L3CHDlz9/28
         77U0CNbYt++gWZWWgL1go9gd+B7ExJMt+lyBx+3eHRwRPRe4jpjq2cEmbmCrb+ss37yu
         lqSSQGZ39tyM6EiH+Pk9fU/r5S/4JRqfT1THqW3nVk2oNOvUvko5iVL9pN/D9arzjQ1K
         b4SA==
X-Gm-Message-State: APuU4Z9fHtSvO0rcIOVITuzWewG4dmokINots+WeX7RocWflToChJp7Y
	FlScl/gkbHWrETPBwWNbSb/PMqZuYz9x+4CqW0wtn1BZmRgsJBxODNnojp5xQyJORGlgHG1dVx6
	W8Ylp3Q3qvL7cuN7foFNJsvCMSB3N8wy9/lIOFxw+G3USL6ZHwt4RFalHHeIFrVe/
X-Gm-Gg: AZFdTZe/I+sADlGou5EPcd0Y7aopjMeaieiF3CF93NfqlcG/vZG0uAvnInw+Uda13fl
	H4gqwgTdO1I0YiWfHm3zxSASCwieA/VL33pmFSt+ShjFn08wZWOHVMpSjnhEn9nKPK2NHCPrb+Y
	FbrC9SaB0v85ARMkOmdowl5slgvFXrA+iiPOKvnYQY9GI2MumPPjIRPa+RJL6VRG5WAJw3joEn9
	Pvb9Tg5raTt3xO6zxuUdUe5DjgF+tmrW8IhN3KjFCMKloXhENixWGX7HxmEMkXi0Fl40BlI4ZhS
	iEMhtbRcvm0BMjyPNwZSvUR+Ms9n2O3N4J1c3pB9e4iAbY8W6p9gIRcstMQ9TnfnafNChqk8tWE
	VUpvURfV0cowtkjPpgN6TBFXLN9DOElzXn10Er8mO0ZqFO+MzLRzfiAqsCWoqcBoOwRjvHoxeWf
	vqvs1P
X-Received: by 2002:a17:903:2f90:b0:2ef:e0f6:b8f2 with SMTP id d9443c01a7336-2f03f1dc68emr144210895ad.51.1795485537894;
        Mon, 23 Nov 2026 17:58:57 -0800 (PST)
X-Received: by 2002:a17:903:2f90:b0:2ef:e0f6:b8f2 with SMTP id d9443c01a7336-2f03f1dc68emr144210715ad.51.1795485537392;
        Mon, 23 Nov 2026 17:58:57 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm60668045ad.21.2026.11.23.17.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 17:58:57 -0800 (PST)
Message-ID: <1ec4b727-a376-42e3-99bf-b5a4d1eb4959@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 09:58:53 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/7] wifi: ath12k: fix MLO active-links handling
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfXzkjK1d9am+Tg
 UAAcYdHYqZ41vNID9t2a6b6IDaUtD0SlXZsJCkr8BwGbAKw/ICw2Ey/iPWNBvxSzB5FUpQ1bE4n
 BfBW6K3y+C9ZLw/RykoCO9zACKR9Das=
X-Proofpoint-GUID: EeVsrbygX5K7yao5EbOWfskDwB57uDmi
X-Proofpoint-ORIG-GUID: EeVsrbygX5K7yao5EbOWfskDwB57uDmi
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b04ef62 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2w8UifUEfps8qvg4efUA:9 a=EUlzmMyR4JpyyxVz:21
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfX6HJROZE2BhJK
 UPqVVZzxhfoPhfX3KcGoUe6EWucAW/JcL4f0sinic5p+qjtzjvX5MgiqLghmjodZ409JKPvWByj
 TsNwgk1BIwd8hOP3B6/nWzxaon49crbzLM8xaI5Sa4BUQj6/4+NG8btSPYKkzNks3bbL7tCKj9e
 kJMQTcntscPms3s+2ExD/kQOWFEpc8pZZSfN5l0MyEqWK7FnlyzcFPxBn09LIt0mOVZBNYohDsk
 R75IlOFawraUyo2wpHAoxUHU0XFrKTM/A7prcHvemMvHaVd/6EWafpfOZouxtIgo+h0onidWLST
 IA1OK+SDebsUftVjRcjuKq/kocatb9BOb5D0v0zo7KVCSTj6ETknpNGhAQdALyDlC7mXp6cJkjy
 vPnPZiZ7XQRrHzwuJtFYh/gzed6SScNL1zaGBUtrgBnO5w0RhCgE3QeKX8kTUTYQZQeXTShXoBi
 6VIXlWVU62REj5/wpfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_175900_107341_40E0A6F2 
X-CRM114-Status: GOOD (  31.85  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/2026 10:55 AM, Miaoqing Pan wrote:
> mac80211 calls drv_change_vif_links() and drv_change_sta_links() for
> both valid-links and active-links changes. ath12k does not distinguish
> between the two, causing WARN_ON/incorrect teardown in change_vif_links(),
> inconsistent vdev state in the chanctx callbacks, and silent
> firmware miss in change_sta_links().
> 
> This series derives link object lifetime from vif->valid_links and
> sta->valid_links, which mac80211 updates before calling the driver,
> instead of from the active-links sets. A STA link vdev keeps running when
> its link is deactivated. The active/inactive link state is programmed to
> firmware with WMI_MLO_LINK_SET_ACTIVE_CMDID, sent to each device that
> holds vdevs of the STA, and only when it differs from the state last
> programmed.
> 
> Patch 1 adds WMI infrastructure: the response event struct,
> WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT tag, and the event handler
> registered in ath12k_wmi_op_rx(). The handler only parses and logs
> the event at this point; delivery to the waiter is wired up in patch 7.
> 
> Patch 2 sets CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP and
> CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP for FORCE_ACTIVE_INACTIVE, so that
> firmware replaces the force bitmaps instead of accumulating them. It also
> copies the AP MLD address into the command, and fixes the
> CRTL_F_DYNC_FORCE_LINK_NUM typo.
> 
> Patch 3 fixes ath12k_mac_op_change_vif_links() so that link vif lifetime
> follows vif->valid_links. A link that is only deactivated keeps its link
> vif, and a disconnect (valid_links == 0) removes all remaining link vifs.
> 
> Patch 4 makes ath12k_mac_get_vif_up() skip links without a channel
> context. A deactivated link keeps its vdev up in firmware but has
> released its channel context, so it must not be used to derive the
> target pdev. The WARN_ON() in ath12k_mac_get_target_pdev_id_from_vif()
> is kept.
> 
> Patch 5 stops clearing is_started for a STA vdev in
> unassign_vif_chanctx(). The vdev is not stopped there, so the flag now
> keeps matching the firmware state. assign_vif_chanctx() then compares the
> new channel with started_chandef: if it is unchanged nothing is done.
> Otherwise the vdev is restarted on the new channel, or stopped and started
> if it is not up. Station removal clears is_started once the STA vdev has
> been stopped, so that a reconnect on targets with vdev_start_delay starts
> the vdev again.
> 
> Patch 6 fixes the bounds checks in ath12k_mac_mlo_sta_set_link_active().
> The vdev_bitmap and inactive_vdev_bitmap arrays are sized by
> WMI_MLO_VDEV_BITMAP_SZ, but the checks compared against
> WMI_MLO_LINK_NUM_SZ. Both are 2 today, so there is no functional change.
> The checks now use the constant of the array they guard.
> 
> Patch 7 makes ath12k_mac_op_change_sta_links() create link STAs for
> sta->valid_links that are not yet in links_map. Link STA removal is
> still left to STA removal, as firmware does not support it. Once the STA
> is authorized, a link holding a channel context is active, and a link
> with a link STA and link vif but no channel context is inactive. The
> result is compared with ahvif->fw_active_links and
> ahvif->fw_inactive_links, and WMI_MLO_LINK_SET_ACTIVE_CMDID is sent only
> when it differs. It is sent to each device that holds vdevs of the STA,
> with that device's links, and the driver waits for each device's
> response, except in the INACTIVE_LINK_NUM case, which is sent without
> waiting. If a device holds some of the STA's links but none of them is
> active, the update fails with -EOPNOTSUPP. If the device crashes while a request is pending,
> ath12k_core_pre_reconfigure_recovery() releases the waiter before it
> takes the wiphy lock.
> 
> Patch 7 depends on patches 1, 2, 3 and 5: it needs the response event
> from patch 1, the ap_mld_addr argument from patch 2, link vifs that
> survive deactivation from patch 3, and a STA link vdev that stays
> started across deactivation from patch 5. Patches 1-6 each apply to the
> base on their own, and the whole series applies in order.
> 
> 
> Miaoqing Pan (7):
>   wifi: ath12k: add WMI response handling for MLO link set active
>     command
>   wifi: ath12k: send overwrite flags and AP MLD addr in MLO link set
>     active
>   wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link
>     updates
>   wifi: ath12k: skip links without channel context in
>     ath12k_mac_get_vif_up()
>   wifi: ath12k: restart STA link vdev on chanctx assign if channel
>     changed
>   wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
>   wifi: ath12k: handle MLO active link updates
> 
>  drivers/net/wireless/ath/ath12k/core.c |  15 ++
>  drivers/net/wireless/ath/ath12k/core.h |  25 ++
>  drivers/net/wireless/ath/ath12k/mac.c  | 335 ++++++++++++++++++++++---
>  drivers/net/wireless/ath/ath12k/wmi.c  |  54 +++-
>  drivers/net/wireless/ath/ath12k/wmi.h  |  11 +-
>  5 files changed, 405 insertions(+), 35 deletions(-)
> 
> 
> base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


