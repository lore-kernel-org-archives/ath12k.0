Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7144606A31E
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 06:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RS1fbyXt;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XD88skF6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UCtPYFot
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SsfcmeOTukl7/t7yQZVfnisPQQJg5RQQ9zI61Zt5Jo4=; b=RS1fbyXtluN39y
	ZZNk7OFFx3zLqQVx0leiQVwNU7uA8Z+hQHv25/hGKGhCkrKzBKkSjvZzTxeVvswQKDF60Xk4xb8XF
	1iZbN32u1ejvxLWbFqeY9vZTtZW9djt41zvGtzW4ozq0ImSUWxi89+y9oV7sVoiYosFa3AEBsv10f
	+n26cUfbL+fQ9g+JXDePG3DCYjtHFPkxeucyAS+96BtEtg9DdoqioqQr0Xpj+4Tj9dZO5gqhyw+oj
	IGVx4pQ2BH4SqX+C8Gh/Omd2wAO0t61tcnyVbTv8JPVUe2Y5sIDyuvB+Bz9TGfj+d9aqcd6I+4UNa
	ITir05PF+H6o8oewPsAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjbS-00000005dB3-05c3;
	Tue, 24 Nov 2026 06:02:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjbP-00000005dAf-3gLP
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 06:02:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k6p23225398
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 06:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SsfcmeOTukl7/t7yQZVfnisPQQJg5RQQ9zI61Zt5Jo4=; b=XD88skF6O75xVU8I
	2WCcnpq4vSCQrWPfnb1NfTs1ovWgRKA8wQD3dXWBgBsMt1AQaFonaoaQDcBuO+IY
	ZmqopUsPyemEZWk5WH1QUxv+ohHyiupwsIxucUVjQv2SU9glld61pGiVYCqzUc5v
	TL1QXouq4oDYtZ0e2jd+PEQPZhnzamL1m5N5mSepHAXzoq6GjXRP16PsjQVFuVPb
	osNzGW1BXMi0bLgKC4td301mflTclbr3CbQarWcAwrbwafZqe0H1nD2J61X+d3mM
	r/wJbXz3wSO9HuNQ0QGVTzXTg0Vuk2w7XlDAAswu98EUmZPAmewEWN45LcHKsjOf
	EpQq4Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f1ecj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 06:02:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cde75c957a7so1870679a12.0
        for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 22:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795500122; x=1796104922; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsfcmeOTukl7/t7yQZVfnisPQQJg5RQQ9zI61Zt5Jo4=;
        b=UCtPYFotSQNEaSSPZxn7rOsjL+ja/WM3t8rT1MFX0zfBStSlhqH5DbbZRE5rZrlzo4
         Hs32da1HZHCVAYnsm/oLQIigeCHS6bxHKy4NOUjaKHhCeZQSaqOgj7fXk4wGlH1eF7qm
         46BU/Vl8FuPwXy1KZMksOdrgXa3lFk5Q6mNmVUJAnQqpiSJ6/wOkufEIVJzFcerkP0G2
         6/Q1pISaRDp1swVf+OeScfHrkOVztUkGP27XO9+w60z3knGwgJE+GIITm2v6cxXUxR2i
         NPAsA73sVZIsWNSFEoxeGL/+PWepaI+ORypoNpsfF6Ib32j39ERuQUb+jWp1GFekR7Lb
         CP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500122; x=1796104922;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SsfcmeOTukl7/t7yQZVfnisPQQJg5RQQ9zI61Zt5Jo4=;
        b=nnHglyew0gYC2m5ctaJPjzfpfZxqVZnxUvAwgL25RSskRumiuDAh9uGGzdegjSxmzV
         odOzqS7a0B61kjy4fjRP8Pr5I0fUz5gRpyGTxgErDMd9p6uTEXb84pJxbcpgcXxLUkM0
         2lOKA2JxTQWT3x/qCGBaEE8Ss72Hey5JEZSrMyy0EgXzTAGIZdULlC3kvhhEG68rtEGU
         NqPGu6G9hVUgC5L7HhztqbTwNxnZ/u5Xrr4AEoaysLZ3gPuX/D//GeXDblTPNb6LUr8h
         cHhbD/uaBDlxPgQhlxLFkV14wvjcf+senpegW1eK1nnjEg2OT1mVLVaBtamOmj14SAfX
         Z3pw==
X-Gm-Message-State: APuU4Z+vjzSQ38XrjlEbN+OrBkhvxMOnN24Lx/VzHqkhovKvIHnVjnOP
	mYrR4rqrRLYJTtvC+2n8ab/RPge2JVjFHu2RaV/q4AacgRlJX3WMK/NDbBWtoAAjUM/kgopnc5S
	67pgB+USTQqaIxXYoSk1fGsoYBKZBvicwsD2ojd72dWhpyvkRM1l2IWkVVfXF9puC
X-Gm-Gg: AZFdTZfCqlbMpnwR2dWVVZHWZgnpjhrKodUgd7HzSJt22TQEU1UOAFMIrlK1PHo2U5k
	bDWrvbc/Oh+7LPD/QlvUm2Z/vwkaHgRdlYmtp1A7GJlk+W4Khp4pVSRpy7KdmN2+y1Ux45AQQ/3
	J+cG8rk2f0St1RTxBiIu1GN0yQnzslA6mFxI7NDbe5UeC8DVA7zSCoT5YtrestpZbBNwq/6t5B6
	zwBfo34aaWLDpR7zY4azFlP0HBJnDvxOObY6u6shOLm2eZbAHAiu6/eEpAjkUJOdYw7SX8TjU0x
	UPBvFktanVwWQWzEZez8zk3ETZ8X43TwmrGOp2tXqA8x+UJMaVPA5eO7LK4J6mXqg9uFc4XmKsU
	PVN0G7RBNVt3z4ytQxTCJ/j5+49CEUT1quoyUoNmUm51usZCCZglqQiDDyxeuGyGEbBvJjHLUM4
	0173xcpDt76TEDK8tTFKriMyZRue9Avz+pBVd77B6t0MDK
X-Received: by 2002:a05:6a21:8281:b0:3f8:f792:236a with SMTP id adf61e73a8af0-400ae723d45mr11885372637.39.1795500121981;
        Mon, 23 Nov 2026 22:02:01 -0800 (PST)
X-Received: by 2002:a05:6a21:8281:b0:3f8:f792:236a with SMTP id adf61e73a8af0-400ae723d45mr11885356637.39.1795500121364;
        Mon, 23 Nov 2026 22:02:01 -0800 (PST)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde9bb05981sm1190320a12.26.2026.11.23.22.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:02:00 -0800 (PST)
Message-ID: <d34b81a7-8dca-4975-b77b-a0344451f25b@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:01:57 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/7] wifi: ath12k: fix MLO active-links handling
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
 <43452750-2fff-46f7-bc61-2f5547602c85@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <43452750-2fff-46f7-bc61-2f5547602c85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyMyBTYWx0ZWRfX8Y9U/NoMLVl0
 SvxUmTWqqj9bKSgSYuVTsd13k6CiGiZGjl3enP7mUo9vwCsn0f2hAWf0Gsh6yepEFpHKS0dOZwr
 KSJjgbub3p/XhMVBlc0GgF/vD/8HEk8=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b05285a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NcXVdgLmtPt-1cCCkIwA:9 a=8HErtrsoAFtHdO34:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: X1zapt_mn5ZhNmWQPqcv2pGb6cHMDlT1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyMyBTYWx0ZWRfX6fAHcKHuPaXN
 wgcDDandsEDJycqu9Ib7kuf6ee7ptP30wCPSAFFqYqD/5JZLNIvExdecYeq93uu6kc59Nnaj5Pp
 UzNcyCr/FR9CCU9ZE3fby6K8LoaMl3lnR+hRPlf2csjuFQX2X7Wxn5y0hxe/gGIY2VfJLJz8Maf
 74vk0feBGLCGmibvaaIKJ56AWbbwS5WW9E2wQntW4bfusUKz6bCX5M2B+V61JFfn+Obt0y3hJfU
 29ie98iqzC3/rBzSR+n7WPLf1wJbblB6Ivs1HNJzAEMMSQjoRVIFEmki5UBXD55C3cp1par9JY+
 3AQ9Mz2ZQYE+a8np92kEus/WqIPKocKspf/XFfcLXtdBeUHtk805Rlf/FlStUMVljlW4xWK/zxp
 BZ7uzp41M4yuWIT+WbTT5qhGFthM2xg/sqH40WvItaxxwagfuYUbXAKXrM4Wn/mqTnEbWwbxWax
 1RaG3UyqCNcT4h2zi7A==
X-Proofpoint-ORIG-GUID: X1zapt_mn5ZhNmWQPqcv2pGb6cHMDlT1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_220203_929084_3D08B4C0 
X-CRM114-Status: GOOD (  36.35  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/21/2026 8:16 AM, Jeff Johnson wrote:
> On 11/17/2026 6:55 PM, Miaoqing Pan wrote:
>> mac80211 calls drv_change_vif_links() and drv_change_sta_links() for
>> both valid-links and active-links changes. ath12k does not distinguish
>> between the two, causing WARN_ON/incorrect teardown in change_vif_links(),
>> inconsistent vdev state in the chanctx callbacks, and silent
>> firmware miss in change_sta_links().
>>
>> This series derives link object lifetime from vif->valid_links and
>> sta->valid_links, which mac80211 updates before calling the driver,
>> instead of from the active-links sets. A STA link vdev keeps running when
>> its link is deactivated. The active/inactive link state is programmed to
>> firmware with WMI_MLO_LINK_SET_ACTIVE_CMDID, sent to each device that
>> holds vdevs of the STA, and only when it differs from the state last
>> programmed.
>>
>> Patch 1 adds WMI infrastructure: the response event struct,
>> WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT tag, and the event handler
>> registered in ath12k_wmi_op_rx(). The handler only parses and logs
>> the event at this point; delivery to the waiter is wired up in patch 7.
>>
>> Patch 2 sets CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP and
>> CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP for FORCE_ACTIVE_INACTIVE, so that
>> firmware replaces the force bitmaps instead of accumulating them. It also
>> copies the AP MLD address into the command, and fixes the
>> CRTL_F_DYNC_FORCE_LINK_NUM typo.
>>
>> Patch 3 fixes ath12k_mac_op_change_vif_links() so that link vif lifetime
>> follows vif->valid_links. A link that is only deactivated keeps its link
>> vif, and a disconnect (valid_links == 0) removes all remaining link vifs.
>>
>> Patch 4 makes ath12k_mac_get_vif_up() skip links without a channel
>> context. A deactivated link keeps its vdev up in firmware but has
>> released its channel context, so it must not be used to derive the
>> target pdev. The WARN_ON() in ath12k_mac_get_target_pdev_id_from_vif()
>> is kept.
>>
>> Patch 5 stops clearing is_started for a STA vdev in
>> unassign_vif_chanctx(). The vdev is not stopped there, so the flag now
>> keeps matching the firmware state. assign_vif_chanctx() then compares the
>> new channel with started_chandef: if it is unchanged nothing is done.
>> Otherwise the vdev is restarted on the new channel, or stopped and started
>> if it is not up. Station removal clears is_started once the STA vdev has
>> been stopped, so that a reconnect on targets with vdev_start_delay starts
>> the vdev again.
>>
>> Patch 6 fixes the bounds checks in ath12k_mac_mlo_sta_set_link_active().
>> The vdev_bitmap and inactive_vdev_bitmap arrays are sized by
>> WMI_MLO_VDEV_BITMAP_SZ, but the checks compared against
>> WMI_MLO_LINK_NUM_SZ. Both are 2 today, so there is no functional change.
>> The checks now use the constant of the array they guard.
>>
>> Patch 7 makes ath12k_mac_op_change_sta_links() create link STAs for
>> sta->valid_links that are not yet in links_map. Link STA removal is
>> still left to STA removal, as firmware does not support it. Once the STA
>> is authorized, a link holding a channel context is active, and a link
>> with a link STA and link vif but no channel context is inactive. The
>> result is compared with ahvif->fw_active_links and
>> ahvif->fw_inactive_links, and WMI_MLO_LINK_SET_ACTIVE_CMDID is sent only
>> when it differs. It is sent to each device that holds vdevs of the STA,
>> with that device's links, and the driver waits for each device's
>> response, except in the INACTIVE_LINK_NUM case, which is sent without
>> waiting. If a device holds some of the STA's links but none of them is
>> active, the update fails with -EOPNOTSUPP. If the device crashes while a request is pending,
>> ath12k_core_pre_reconfigure_recovery() releases the waiter before it
>> takes the wiphy lock.
>>
>> Patch 7 depends on patches 1, 2, 3 and 5: it needs the response event
>> from patch 1, the ap_mld_addr argument from patch 2, link vifs that
>> survive deactivation from patch 3, and a STA link vdev that stays
>> started across deactivation from patch 5. Patches 1-6 each apply to the
>> base on their own, and the whole series applies in order.
>>
>>
>> Miaoqing Pan (7):
>>    wifi: ath12k: add WMI response handling for MLO link set active
>>      command
>>    wifi: ath12k: send overwrite flags and AP MLD addr in MLO link set
>>      active
>>    wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link
>>      updates
>>    wifi: ath12k: skip links without channel context in
>>      ath12k_mac_get_vif_up()
>>    wifi: ath12k: restart STA link vdev on chanctx assign if channel
>>      changed
>>    wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
>>    wifi: ath12k: handle MLO active link updates
>>
>>   drivers/net/wireless/ath/ath12k/core.c |  15 ++
>>   drivers/net/wireless/ath/ath12k/core.h |  25 ++
>>   drivers/net/wireless/ath/ath12k/mac.c  | 335 ++++++++++++++++++++++---
>>   drivers/net/wireless/ath/ath12k/wmi.c  |  54 +++-
>>   drivers/net/wireless/ath/ath12k/wmi.h  |  11 +-
>>   5 files changed, 405 insertions(+), 35 deletions(-)
>>
>>
>> base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
> 
> My review agent notes there is a pre-existing issue that isn't addressed by
> this series.
> 
> The review:
> "file": "drivers/net/wireless/ath/ath12k/mac.c",
> "line": 12683,
> "summary": "arvif->is_started stays true when vdev_stop succeeds but
> vdev_start fails, breaking the firmware/driver state invariant",
> "failure_scenario": "In ath12k_mac_op_assign_vif_chanctx(), the !is_up
> STA restart path calls vdev_stop (which does NOT clear is_started) then
> vdev_start. If vdev_start fails, is_started=true but firmware has the vdev
> stopped. started_chandef still holds the old channel (vdev_start_restart only
> writes it on success). On the next assign_vif_chanctx for the new channel,
> the same-channel check (line 12673) does NOT fire since
> started_chandef≠ctx->def; however, calling vdev_stop again on an
> already-stopped vdev hits the num_started_vdevs=0 WARN and corrupts the
> counter. For the same-channel case a future assign_vif_chanctx would silently
> return 0 without restarting, leaving the STA with a dead vdev in firmware
> indefinitely."
> 
> My refute agent concurs:
> is_started can diverge from firmware on a failed vdev restart ·
> mac.c:12667-12693
> 
> Confirmed the mechanics: ath12k_mac_vdev_stop() (mac.c:1556) does not clear
> is_started, and ath12k_mac_vdev_start_restart() only sets
> started_chandef/num_started_vdevs on success. So in the new STA restart
> branch, if vdev_stop succeeds but vdev_start fails, is_started stays true
> while firmware has the vdev stopped — which violates the very invariant this
> patch introduces ("driver state matches firmware state"). A later
> assign_vif_chanctx for the same (old) channel would then hit the
> cfg80211_chandef_identical check and return 0, leaving a dead vdev.
> 
> Caveat on severity: this is a firmware-error-only path, and it exactly mirrors
> the long-standing switch_vif_chanctx() error handling (mac.c:12007-12019),
> which has the same gap and clears nothing on failure. So it's a real but
> pre-existing-pattern concern.
> 
> I also concur with the recommended action:
>   — worth a note to the author (clear is_started on vdev_stop success / after a
> failed vdev_start), not a submission blocker.
> 
> So resolve with a follow-up patch if necessary once this series lands.
> 
> /jeff

Thanks for pointing this out. Agreed, I'll address this separately in a 
follow-up patch.

