Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B07606A698
	for <ath12k@archiver.kernel.org>; Sat, 21 Nov 2026 00:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rFvr66kR;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Edc0PtUk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X8NxPNfL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RuWSO5lF81+wvYpAYjE1usBrB0yozSwPs1b5w+/cvek=; b=rFvr66kRhY3u3p
	Xjq/QWVJfMa3zVdUUP8Fh1QGBgsIkdcDwjzXRqtR/9NcwPZ1nu2srCh4VbudljXJVGmRTTYoiWE6q
	Yv8Z0zlhvW0WGdov/85kyMnwbfYVlIBJor1vbKXSA7JK9CoQ1ugOGh/gdbcIdiUM6Mr6DYrdNMZd1
	cUSEDFya8U7nE7ufRRO5Vwb1JUoL+RlNSkXItCNwEyUUFzuqVEfbzqk4vVTHmbA7BPHk6YlMRBsg8
	QjUC3O30SNn11uZabrHB3oYzKqnYtaob/fZD7G18x9vLkWs6ZtMqQCJrdS94MCoDDxF3dbsDvcBne
	6Xzv7ztX6xiaVP2zl8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYm9-0000000GUPV-0VsN;
	Sat, 21 Nov 2026 00:16:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYm7-0000000GUOd-0MNj
	for ath12k@lists.infradead.org;
	Sat, 21 Nov 2026 00:16:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL0BAkY2808226
	for <ath12k@lists.infradead.org>; Sat, 21 Nov 2026 00:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RuWSO5lF81+wvYpAYjE1usBrB0yozSwPs1b5w+/cvek=; b=Edc0PtUkP9FWaIhe
	lmdyvkougjdN+MSXtPR0+1xryNxiwSrs2TbxSvthgsG5SwZ8lEk0PHo0V52O63JU
	UknBG8+vXBi1B7Awd4JWI0XDTsvU7HHM4Qlz9E/In0ypMqmgrMhP6J+Bp9XC90Do
	Ua3YXOW83YmES7jef7dI4Prg1jp5C/IbX/DzS/9gxVS/JvVZ0n/x0a72eJ98404a
	wv9+KOoRi6UoK95WXYQh7QyK4f+ljHQDNPWf9TEBEw3bSYb2SckRy26xMQr9nazE
	Xcb+H6hqM2wjE9SbOAfFt0CVTf+8rwyRR0sUoF7puJUGJLqXAZpD5msg8aUZ06LI
	+2DemQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2t7vhgyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 21 Nov 2026 00:16:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso4470428eec.1
        for <ath12k@lists.infradead.org>; Fri, 20 Nov 2026 16:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795220172; x=1795824972; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RuWSO5lF81+wvYpAYjE1usBrB0yozSwPs1b5w+/cvek=;
        b=X8NxPNfLvVEEA96h4c1WzbU8qF5k1WAe3Oh+l/n7RuUuLW7S0WgCAxH/xDHHpcsF3b
         TLVvlcqsF5zWi5y16FMcme/psv4ul2Fi07gEkBBTv0HwjTN1azh/OcJFSwFudPrraPCL
         z3s2csWt4OChOl0YI2FiwUHIIIYM3TCW6BPHSMlIIFEai8ckRaRNK9IsfLIf4bu/2HRy
         vRHqnbdg3eIb3NZPOgvnQo6gP7HIZ5uLlzab0hF8bo062rjBa2SHWHcCsEed5oNgcnVT
         sDsC4oQo1GySlJQW+Xxwj+EqSj/sWA4Y11hvzpQfugOff1ik0zuGam5MPNAw28MWu4y4
         PMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220172; x=1795824972;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuWSO5lF81+wvYpAYjE1usBrB0yozSwPs1b5w+/cvek=;
        b=sgU+IsYqDiwsjw9Ru1p6fFFH4dt7AEvHWSgi4voTb56MJKUwZI2MyVuofOR+f08gWE
         HBXqOV+Teyc+1HAShPEQQ3ClMsSYgNPsQ4yh/QeyasmN4U0p6ifoV4csQbLl72eoIR1H
         X4hpg1h1lXdC2xt2zUYiTslZ2QaJ0lRacG1rf5Y5IPrnTxKu8HjRdtJScAOYVtlpvAuz
         hMsxItXNSTzErRtEi9h76EOtzWyFGSYiutUaM/V3wyuel3npTdKNFzXQfszNyAXrcYnF
         JfAaI+T8vAtKct8BSw+0jlag/qPtmZ56sCMhy2BrlYTQi1MSjCG5EDi+vazsPj6uUwrb
         E51A==
X-Gm-Message-State: APuU4Z8SnlsLczX2id7pi25so5wOqw5k/m/I75apqKiWIpL2/yzQNqbr
	o2KLqMwFOGk8ap7/lv5NBg75/gBesJ1K+XdORonA6Ht4Mxei3qnjybNWfmvU7q7CxEbFp5KO4jg
	UDYaO3Z3eWW8cph5suupfSqDtdh2/QhjmxIKRMc7rhmTZmgWp6fUjqLwzFmDnJ8Fa
X-Gm-Gg: AZFdTZeksmnwTJm94AqLuFGgaTyrQ2Ly4NZsesmpswdbQ+ibQZ9aUz6s0IvFK6BqAIO
	fp/sEutKPtuJXuD6S1TB1gBgXdRlnmcTS5AN41iQS0eoY2g3onZDCWafwSpTvnVhgfvxtzWxLaX
	K3VLln0M2i4CIabM1ppPdEISOSxe6b2sWAOpPsYqUT4zzIjKN8z/dKsXONJFOhIDh91+EArt2dz
	dkgecfx5KVRt8oK+sKtuQL+Zvv13DE0QEH22p4eLYoR7pLfAHlmamhmliBtY0Osdce/8F9q4lIa
	wHuDNrlqqQSJz4YLIISCZzJKkQ05MWw0GZb6AriBa3JSTBOdQyMHKmV3ZR8EJ4vb5K9ODpKH2Ca
	wVNHHxKF+VAerhYz2HlS1Woi3N1XgWUH29dGX4yMIl+RqPuptOpsfCKWxBlSdra0X/khoc1O602
	l6Y97k60AE/2LWzJuV8y/rg0fwXFgK
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr4873233eec.14.1795220171838;
        Fri, 20 Nov 2026 16:16:11 -0800 (PST)
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr4873184eec.14.1795220170973;
        Fri, 20 Nov 2026 16:16:10 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm10282028eec.8.2026.11.20.16.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:16:10 -0800 (PST)
Message-ID: <43452750-2fff-46f7-bc61-2f5547602c85@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:16:09 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/7] wifi: ath12k: fix MLO active-links handling
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: j6N7RvARzGbdGr9LmlnZ2m4yIkgMhuH7
X-Authority-Analysis: v=2.4 cv=BZZNQbt2 c=1 sm=1 tr=0 ts=6b00e2cd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=4HNrfPhIyE3k3xtOv_UA:9 a=EUlzmMyR4JpyyxVz:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: j6N7RvARzGbdGr9LmlnZ2m4yIkgMhuH7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAwMCBTYWx0ZWRfX2PsXaS/tycgk
 62OWjW8YjLAxmKw3NvWJXEPMxNXkcSb2ENKpWkjq7Sb8jIOaNA2ieQ4ud9UKbCGCIXA30FRcdbx
 az3oukH5H5vK80fVBvWPC9WQHXqpGkg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAwMCBTYWx0ZWRfX/iwpgGdWIYfY
 zCyn9BmvE8Me2stDdg5GRBQ0hJtonnKlaO9Z6SyoKLISmJmUJFOeJZSfTwpjOrfj5LO1+Jsh26b
 XkVRslfsrIhjs7YKVUNwH2GDl359/VwPQKTS/KcA896IgpZ1IvuJ2YIm9JjFry628Y32w6Quhve
 sZmKFlCEpgz04Vnne8U/4NnXpKnSRtsTR+WW0PlU4rE0AlDCmjcLoRBGUHqxUv8lmysBDKPmrFa
 bbeBUSe+KRGi0rpiqpt1/GgXJ2VfkEpPDhZw77IVnBgDZhSlhr6ovqbkY1FZngsyfzwhYMbSjZ1
 TZgZjtv/TMD2k6LFaoTzG//Xzw8ayNy4EVaHHQ8bjbNfonlUC06XRqMBK2iYvfUQvQdDrgHEvVU
 +RFRzptw5f/S5+9UVY4M27xwWTwjWSf7CHT7O5fScyXM8LIBAIC2v3d5El4BY1J3GAIqDitfsWB
 gBXdiq7jRtshX+dpPMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_161615_246188_C1689358 
X-CRM114-Status: GOOD (  37.22  )
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

On 11/17/2026 6:55 PM, Miaoqing Pan wrote:
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

My review agent notes there is a pre-existing issue that isn't addressed by
this series.

The review:
"file": "drivers/net/wireless/ath/ath12k/mac.c",
"line": 12683,
"summary": "arvif->is_started stays true when vdev_stop succeeds but
vdev_start fails, breaking the firmware/driver state invariant",
"failure_scenario": "In ath12k_mac_op_assign_vif_chanctx(), the !is_up
STA restart path calls vdev_stop (which does NOT clear is_started) then
vdev_start. If vdev_start fails, is_started=true but firmware has the vdev
stopped. started_chandef still holds the old channel (vdev_start_restart only
writes it on success). On the next assign_vif_chanctx for the new channel,
the same-channel check (line 12673) does NOT fire since
started_chandef≠ctx->def; however, calling vdev_stop again on an
already-stopped vdev hits the num_started_vdevs=0 WARN and corrupts the
counter. For the same-channel case a future assign_vif_chanctx would silently
return 0 without restarting, leaving the STA with a dead vdev in firmware
indefinitely."

My refute agent concurs:
is_started can diverge from firmware on a failed vdev restart ·
mac.c:12667-12693

Confirmed the mechanics: ath12k_mac_vdev_stop() (mac.c:1556) does not clear
is_started, and ath12k_mac_vdev_start_restart() only sets
started_chandef/num_started_vdevs on success. So in the new STA restart
branch, if vdev_stop succeeds but vdev_start fails, is_started stays true
while firmware has the vdev stopped — which violates the very invariant this
patch introduces ("driver state matches firmware state"). A later
assign_vif_chanctx for the same (old) channel would then hit the
cfg80211_chandef_identical check and return 0, leaving a dead vdev.

Caveat on severity: this is a firmware-error-only path, and it exactly mirrors
the long-standing switch_vif_chanctx() error handling (mac.c:12007-12019),
which has the same gap and clears nothing on failure. So it's a real but
pre-existing-pattern concern.

I also concur with the recommended action:
 — worth a note to the author (clear is_started on vdev_stop success / after a
failed vdev_start), not a submission blocker.

So resolve with a follow-up patch if necessary once this series lands.

/jeff

