Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B22A606A326
	for <ath12k@archiver.kernel.org>; Sat,  7 Nov 2026 18:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Ko1rD2a;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tpe1w4AO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gt/YbRPv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wUljkWXM5YIr3IHe/ud5vspaOE/fK8urBfswZ8VpV9Q=; b=3Ko1rD2aYnSnsf
	RpOKIpytIJn8Vcf7hy41n86+F2blaHBShlfYvCVWUH1DyeehaXWw3kG9B57KimMi7uJ/hlu9LsGmK
	ka3t/U2PqNoGUBf6p9PZ7X5FhE7gMS+SlbiT3X48YDPyb0QaVvc/NgcFHaIi0vGbX7GVOsWSkk8CL
	d5NL6ESW8tTg9zVriGCfcHOM/gQ4k0RiuIEia28l84/dXehZKI0hcu0v1bRFn5a6NtYzaBotah4A2
	ChQgGWA5+db2twYNmL1ZbjzE5Lste0Nf4G1K2VRcvv79uODROJjeeJS4CRLxP/7Rr8KgoF/Ylxr7e
	QfoQ1Zok08i5I8pxrZmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPlNU-0000000FBwU-12Ui;
	Sat, 07 Nov 2026 18:43:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPlNP-0000000FBvt-0vK5
	for ath12k@lists.infradead.org;
	Sat, 07 Nov 2026 18:42:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7Ht6OC206192
	for <ath12k@lists.infradead.org>; Sat, 7 Nov 2026 18:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUljkWXM5YIr3IHe/ud5vspaOE/fK8urBfswZ8VpV9Q=; b=Tpe1w4AOCXSQrylg
	/UdbmHQb/3XF87X2knL/1Un9ukQ6kSfhLPPz3Bhz0crDK0bHJgTnDJPkfy7KIc/y
	YVotijc986zVBDsZ15VpR+adMsogm8od/gxtGB7QwXBWKiAY5ROIYc0UAppesU1Q
	AxYOpOl8gzvY6nYQ6qYdQZkILbaW7j07jBy4+XYNvgoSkAvKGiKlK98+k60epo4N
	UPbAf+uYncz8ghivtbgX3yg/fZpTf2YFrC0Mm3rj1zaAJP5mZlpdgzkK0D5M1O9d
	BgbeVtp9a6zesM6TET1dpCFhnNnGaq/I0MUWO4kJj+1rpLR7qjxQmcudSJGK14jy
	tUFReQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf1tqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 07 Nov 2026 18:42:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f26e6abe9so3101897eec.0
        for <ath12k@lists.infradead.org>; Sat, 07 Nov 2026 10:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794076973; x=1794681773; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUljkWXM5YIr3IHe/ud5vspaOE/fK8urBfswZ8VpV9Q=;
        b=gt/YbRPv3A++jnUWNJROLCxEoFytdzNXunCCbHrvPwKGzDafVxMO6AZOpEaZXIwl3I
         ocMYx/TsdJiWobAKuNFtt9WnyAA4VeXZ+mPUqbd5RaMYsg96Bf8PCvLeae9/Iam0RoZd
         d1Wzvby7bCBhjA92edUdKRRSlylAkDPqz7duN9qe+llE8hPvInu58Dz2vi2/kojgYhqX
         wpnX3y8n5UqG92bGxTNy8hkydPVubwkM9dAxPvop40+piZhWjdjYVazWYrtzFVh9zwOF
         XyxuWejZscAh+OzZLYAuaaoguRx5G0aqr2t48XyGV+hEuru575ysaeHR7gsV31uUUM38
         dpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794076973; x=1794681773;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUljkWXM5YIr3IHe/ud5vspaOE/fK8urBfswZ8VpV9Q=;
        b=HhsrAWxuKWG4Ms0KAbf6zoVCMxZV47Z0rSvDRlkZ23CIXD8GrVBgVQY2HBE28AHJFF
         XYir4+lWW6V9S6yyNxjABE2ZiB+vX7zxzSuDi8FUfsofhR/jYF3gB9APuBFBNOe/sjgh
         kAg+MSPb1iuc7nmpZTgIJdIw7VJL/6pzX0WJl5uHqbwwbLRbqY9Rge7SC1icyqFYZ4Nu
         gizp4BUtTGWoGY9aLip0RH6dAynG0qFljoxyxlriYGCA+pUCxjq7yOzouZOMkLr6zGlu
         Xd6THcyXJibmTqLmDCKvA8nO4mKrZSUGEoq+uzxlsQ7NmfAehfkYFwTzKb/B5Q46tnNa
         quow==
X-Forwarded-Encrypted: i=1; AKwUvBwej7F0neLIyfvP9Qb6bKAGa49aBNWZc007uTPMmjBFxSFQYEsxBiCxPcdFMLZBxlyOEnvElDk=@lists.infradead.org
X-Gm-Message-State: APuU4Z9Zruq/IVV/JV9KnphwlLfPGHLxdyr6AxUuyDMlRXhKuFDmXUzF
	Lmty1rE34z7TqZqixGXwI5AMow/xJPlqQjMbf2SmQXTVKcXl5PpzeVd6U8WO1TQwOkSqzpqWh1h
	j1zvd9L0LuOU3pfDd6Z+05/13WvgF5QzEsIlbqOR+0eZ6Yfc3ogA4fbSu7M3M3Z3l
X-Gm-Gg: AYBFou3QhibdWYz6Tl/JZEBTxRb7b7gaJFQc0EEUhvjPWiVd5Z9rmd1AGLgm33iQiYa
	+1OmenR1giEPxDMjynt4E8GHSNPbvZf2noie3HPvp4ASX+GHX8xusiznxj7Kkw5r4bkHjbwbIzq
	tw/NgkOA6Dk87DptVIhwFpVHVMLEWojMBtK+NsrbPo7cH5NPUjtU+BHhLAMh5NHJ70Q3uZAU5ni
	Y5X2pUlqR8rcS5wBbCzQ292yvN7rIA2jpBgPIlV7kyeo623/JFqQ4l1NxTZrTARB+q41JliSx36
	S6T9ruZExvAJya0Q9ozgl+psq6pCYBjIiN2RSxy/Z/L99kV5Hb5/58jxBCm8tIQUNrchvvnCjQn
	GJVFZ3otMwZJwC20EbaBd1T085eCljbl/FQqvGo9NAVxMpS6aW+cBtIkzZpKjXBrtzZLTvjIXVb
	+jU209VZ8Mn3fYnyCX86BSSaF1vsIUfQ==
X-Received: by 2002:a05:701b:42c7:20b0:185:8c9f:de82 with SMTP id a92af1059eb24-1b25d33da4amr7987508c88.33.1794076972303;
        Sat, 07 Nov 2026 10:42:52 -0800 (PST)
X-Received: by 2002:a05:701b:42c7:20b0:185:8c9f:de82 with SMTP id a92af1059eb24-1b25d33da4amr7987469c88.33.1794076971448;
        Sat, 07 Nov 2026 10:42:51 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm230374c88.13.2026.11.07.10.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 10:42:50 -0800 (PST)
Message-ID: <e2c96de5-7d70-4534-9f2f-7503d1d3aa50@oss.qualcomm.com>
Date: Sat, 7 Nov 2026 10:42:49 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: accept num_users equal to
 HTT_PPDU_STATS_MAX_USERS
To: Goran Sustek <gsustek@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20261101203718.60679-1-gsustek@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261101203718.60679-1-gsustek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA3NCBTYWx0ZWRfX5POdNEudNtOy
 kBgRlIXjb/Fv48U9Feyae+npYNNYDuG69EVNE81cjdHRtU9mGJ6V1iMIMv3vW4bb2eX3KXYM0uS
 5Z5rYMsYVIRUBcwrxcjUaxip/ESrXJg=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6aef712d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=rp710-oh4uw8x6QSWtcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: nRVBxcVJk1YPj8V4L-coL_xNwHXL7DXw
X-Proofpoint-ORIG-GUID: nRVBxcVJk1YPj8V4L-coL_xNwHXL7DXw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA3NCBTYWx0ZWRfXykNJu+JSaT6t
 TPBMZB7W3FKQwH4xVHrRs/JZnNgSfq8rWHYHTCZ2gt2RX7xF5f4Z20Y5axOtvuZ16mRCGIVfuEg
 XLoyKFjVQsevR6CdaTnd/j2lUaW2q+e96E/Cq7IKmlb1wsHw583Q5meSqAlNthI5h+DKKrG14us
 EKtPs/w+QeQy2W5m3t3YwOrjJBc/01WuQ7m2ljIUsW2Ik3qeTT8gkuQA8TViASmYfN67edXNpXr
 fVWyHgrnZhcaiclHUplHH52JBC+n6paBkc62UvFVVZpEcn6dPT0iKqmgHLEZioj+Z285pHNRClA
 ey08AEns9PghkAtKpOPsxf0Ug/rP+Uw+zO0DkULi4OekcLiT+3qycpZRM4ArEnwhRj1e53NP6zk
 7l5FmBKt12B4D0Hg5/lAJd0JK7IQ9AlGAmJj+DO1RvIIt8rQOM9MBGwiNc1zCnIJwwLsn5/rHQd
 dzRt4v3e/EoDhxWESHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_104255_290904_8C759D0D 
X-CRM114-Status: GOOD (  38.63  )
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

On 11/1/2026 12:37 PM, Goran Sustek wrote:
> ath12k_htt_pull_ppdu_stats() rejects a PPDU stats message when the
> common TLV reports num_users >= HTT_PPDU_STATS_MAX_USERS. The check
> guards a loop that iterates i < num_users over user_stats[], which has
> HTT_PPDU_STATS_MAX_USERS entries, so num_users equal to
> HTT_PPDU_STATS_MAX_USERS stays in bounds. Commit 1bc44a505a22 ("wifi:
> ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()")
> rejects that value, which is off by one.
> 
> QCN9274 firmware WLAN.WBE.1.6-01243 sends num_users 8 in messages that
> otherwise parse cleanly. One AP logged the resulting warning 468 times
> between 2026-08-17 and 2026-11-01, always with the value 8, and never
> logged "Failed to parse tlv":
> 
>   HTT PPDU STATS event has unexpected num_users 8, should be smaller than 8
> 
> Accept num_users == HTT_PPDU_STATS_MAX_USERS.
> 
> Rejecting a message has no functional effect: the PPDU entry stays on
> the list, its per-user statistics are applied when it is evicted, and
> the only caller ignores the return value. A larger value is therefore
> not worth a warning either, so report it at debug level, as done in
> "wifi: ath12k: downgrade log level for CE buffer enqueue failure".
> 
> Fixes: 1bc44a505a22 ("wifi: ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()")
> Signed-off-by: Goran Sustek <gsustek@gmail.com>
> ---
> Notes for reviewers:
> 
> The check guards two loops that can never run. Both are gated on
> ppdu_info->tlv_bitmap, frame_type, delay_ba and bar_num_users, and the
> first also on the per-user delay_ba; none of these is written anywhere
> in ath12k, not since the initial driver (2022). The parser that would
> fill them (per-user common TLV, MU-BAR user count) was never ported, so
> ath12k_copy_to_delay_stats(), ath12k_copy_to_bar() and the peer's
> ppdu_stats_delayba/delayba_flag are unreachable as well.
> 
> If you prefer, I have a patch ready that removes the loops, the helpers,
> the fields and this check instead (about 90 lines, no functional
> change). Keeping them only makes sense if delayed block ack accounting
> is going to be implemented. In that case the BAR restore loop also
> needs a bound (it iterates bar_num_users over user_stats[] unchecked),
> and note that the per-user slot finder only uses
> HTT_PPDU_STATS_MAX_USERS - 1 slots.
> 
> Compile tested only (W=1).
> 
>  drivers/net/wireless/ath/ath12k/dp_htt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
> index 72069640bd38..9a409dd44d98 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_htt.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
> @@ -487,12 +487,12 @@ static int ath12k_htt_pull_ppdu_stats(struct ath12k_base *ab,
>  		goto exit;
>  	}
>  
> -	if (ppdu_info->ppdu_stats.common.num_users >= HTT_PPDU_STATS_MAX_USERS) {
> +	if (ppdu_info->ppdu_stats.common.num_users > HTT_PPDU_STATS_MAX_USERS) {
>  		spin_unlock_bh(&dp_pdev->ppdu_list_lock);
> -		ath12k_warn(ab,
> -			    "HTT PPDU STATS event has unexpected num_users %u, should be smaller than %u\n",
> -			    ppdu_info->ppdu_stats.common.num_users,
> -			    HTT_PPDU_STATS_MAX_USERS);
> +		ath12k_dbg(ab, ATH12K_DBG_DP_HTT,
> +			   "HTT PPDU STATS event has unexpected num_users %u, should not exceed %u\n",
> +			   ppdu_info->ppdu_stats.common.num_users,
> +			   HTT_PPDU_STATS_MAX_USERS);

please don't change the warning. this is flagging a discrepancy between the
driver and the firmware and should be reported if it occurs in the future
(i.e. if a future firmware supports more users but the driver isn't updated)

>  		ret = -EINVAL;
>  		goto exit;
>  	}
> 
> base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad

My review agent says there is lot of associated code that is also treating
HTT_PPDU_STATS_MAX_USERS inconsistently. Much of this is directly inherited
from ath11k. I'm posting these finding here so that the developers can further
evaluate what approach to take with this patch.

BCC: Qualcomm's ath12k internal review list

/jeff


❯ can you provide a list of references to the patched version of the ath12k
  code where num_users == 8 isn't properly handled?

Here's the corrected and complete list, now reflecting that the firmware
genuinely sends 8 users and the 8th is silently discarded. All sites are in
drivers/net/wireless/ath/ath12k/dp_htt.c unless noted.

1. The 8th user is silently dropped during parse (root cause)

- dp_htt.c:49 — ath12k_get_ppdu_user_index(), loop i <
HTT_PPDU_STATS_MAX_USERS - 1 (0..6). Can only allocate slots 0..6, so the 8th
user never gets a slot and the function returns -EINVAL for it.
- dp_htt.c:95-96, :115-116, :135-137 — the three parse cases (USR_RATE,
USR_COMPLTN_COMMON, USR_COMPLTN_ACK_BA_STATUS): cur_user =
ath12k_get_ppdu_user_index(...); if (cur_user < 0) return -EINVAL;. For the
8th user this returns -EINVAL, so its rate / completion / ack-BA TLVs are not
stored.
- dp_htt.c:176-178 — ath12k_dp_htt_tlv_iter(): if (ret == -ENOMEM) return ret;
— only -ENOMEM aborts. The -EINVAL from the 8th user is swallowed, the
iterator continues and returns 0 (:183). This is why the drop is silent and
:486 ("Failed to parse tlv") never fires — reconciling the commit's field
evidence with 8 real users.

2. The 8th user's stats are never reported (consumer side)

- dp_htt.c:365 — ath12k_htt_update_ppdu_stats(), loop user <
HTT_PPDU_STATS_MAX_USERS - 1 (0..6). At eviction this pushes per-peer TX stats
for users 0..6 only; index 7 is never consumed (:195 indexes user_stats[user]
with that capped counter). Even if slot 7 were populated, its stats would not
be reported.

3. Loops whose ceiling the patch widened past what sections 1–2 can fill

- dp_htt.c:504-512 — delay-BA backup loop, for (i = 0; i < common.num_users;
i++). The patch (:490) now lets num_users == 8 through, so i == 7 reads
user_stats[7] (:505 peer_id, :510 usr_stats) — a slot section 1 guarantees is
empty. In-bounds and benign today (write at :512 gated by usr_stats->delay_ba
at :511, which is 0 for the empty slot), but it's the concrete ceiling
mismatch: num_users admits 8 while the allocator fills only 7.
- dp_htt.c:519-527 — BAR restore loop, for (i = 0; i < bar_num_users; i++),
reading user_stats[7] at :520/:525. Driven by the separate bar_num_users
counter (dp_htt.h:1296), never bounded by the :490 guard before or after the
patch — same empty-slot-7 exposure, pre-existing and independent of this
change.

4. The patched guard itself

- dp_htt.c:490 — if (ppdu_info->ppdu_stats.common.num_users >
HTT_PPDU_STATS_MAX_USERS). Correctly stops rejecting num_users == 8, but it's
a necessary-not-sufficient part of "handling 8 users": without the - 1
removals in sections 1–2, accepting the message just means the 8th user is
discarded a bit later and more quietly instead of the whole message being
dropped.

Supporting declarations

- dp_htt.h:1282 — #define HTT_PPDU_STATS_MAX_USERS 8
- dp_htt.h:1287 — struct htt_ppdu_user_stats
user_stats[HTT_PPDU_STATS_MAX_USERS]; (slots 0..7)
- dp_htt.h:1115 — u8 num_users;
- dp_htt.h:1296 — u32 bar_num_users;

Excluded after checking (not this path)

- dp_mon.c:905-909, :1049-1053 — ppdu_info->num_users bounded by
HAL_MAX_UL_MU_USERS, separate monitor-mode struct.
- dp.c:355-417 — TCL bank-profile num_users, unrelated.
- debugfs_htt_stats.c:2166 / .h:1216 — a separate __le32 num_users display
field.

Bottom line: to actually store and report the 8th user, the minimal change is
removing - 1 at :49 and :365 (both in-bounds against the 8-slot array), on top
of the existing :490 relaxation. Sections 1–2 are the real gap; section 3 is
the cosmetic ceiling mismatch that disappears once slot 7 is legitimately
populated.


