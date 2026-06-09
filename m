Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FAACD8CAA
	for <ath12k@archiver.kernel.org>; Tue,  9 Jun 2026 11:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDB1dEHH2BhhuQ8aVpHpSbKQtwpVexmrNc4K+WJYSl8=; b=29vw0dGKQWg/zoTAGa9wMrLu4F
	zXp6u/Mf1G+HR2KnS56sPeVdS2MWtuKTiMqvL9km2oTII+a0C/InHjdcLSjAmjCedE1vNmaZFG4nY
	x59WJcc+KOGKLFIwhXFixMtBreFyUOu8c4sWzoGEgzFF6FYQ9OuSzv9JTm0TSZhsVviv+QxeBTUEW
	aOjSvFZq0gtOsD1rq7nm3zSuoIxi5lkpWgy9vT8t7YWmDBoei1/v15D95kyHJXV/aQpHdj9GUpODp
	t9IuqasGCMl/svE1H7CeNt2+Vo+chjTaSdJ6Bqgw6XVlscE3FcCxwwVwy4k7Rxw7jR9g0+MIZGlvo
	4pesxbuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuHi-00000005PYZ-3CA0;
	Tue, 09 Jun 2026 11:06:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuHc-00000005PXE-1Kt4
	for ath12k@lists.infradead.org;
	Tue, 09 Jun 2026 11:06:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vIwT1800694
	for <ath12k@lists.infradead.org>; Tue, 9 Jun 2026 11:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDB1dEHH2BhhuQ8aVpHpSbKQtwpVexmrNc4K+WJYSl8=; b=o7JacjhUJBxr2Z1y
	erJe0qdWA93RJaH4eN9GTOl/KDhD1NKlG10UpJY6ktNKjK7phpfuNbKtC+LtQxMf
	VMlNxG8vOmj2bZolmzqoCdIcoVGYoe/hx7HPxYwn6aWprdLUDSFJirLqJ2/5M9Wg
	uV+uWvTfClhuPfDGVnIGfIhxH2tpiJl29RsFaW+R+tvfH54E77Jpa0DgmJLxBk+a
	3g2PDnr27nN0F1l0xeBV4q9P34MhinEvsYIu8AZ/J0VoF4KBNPL3NAMPuZMalDrW
	CZt1c+5jaeQrtb0oWtxWmso5zAwlZ9UL3o/JYdfSBVybwdi8GqcGf0xTqkPQnVpp
	M8TPJw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr8swk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 11:06:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85dc345ac8so2727086a12.1
        for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 04:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781003171; x=1781607971; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oDB1dEHH2BhhuQ8aVpHpSbKQtwpVexmrNc4K+WJYSl8=;
        b=Pr7mWIeDrfKZnFk4h9M8/thaIbn9HlEZaxygXyVfa0cTwwk7P6gTsB92DmGrTkVY4c
         y2SUwXR4WvgIXm5/m1dW9DnN83zMgfyRd7fK3qITJvKYcMbkE0gn9KmcAgHTh/DrwhmL
         eivoq3FLjzTFeD8BvyDCvlTgnbDUO4mVmk+ZJA4M8fiqxloPp9L/hVdnvKpdqhz19Z5X
         RahU6H3dDO/TG2HZ13NrgZA5YWcBc+ibKkGElGbdBIM32WCLDLCIj+kSAgrqF3WvwDI7
         Mbvo/b93shX1np9tvEgj4e0QNNRIs1r/A7QEgk/+Tl/ifR56Nat5xRhZ8uegwJ6lHouB
         wFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003171; x=1781607971;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDB1dEHH2BhhuQ8aVpHpSbKQtwpVexmrNc4K+WJYSl8=;
        b=nMHpivKLSRyvPVVC8cLImIQg4SSHYrmFiG7DJEWPinsIhCnGpmXqUYkc6rQKjVYI3x
         5viIlumj8SzEicZhasqU3ligz/Ee0hwVNaN3x0iqPpny9bKS+SjbvI0+W197qYDdKuBM
         bi/2vorgHKcCCdGcylJfM0WLallAYa6HCMLq3k2+3bbj082RTBlv6KuOlL4WccarNWoH
         a/Fa3xP/yxgxFU18Fq/cW+422ppJZTjqQQav9PQ8d/SmCq3EFGxu6weP71oZgjXnFW5u
         EHILbPLNLmeF+Mf05crUF43xdcpXJLps5Ldevzjk/YSx6qgnflqpzg1OHr5QnTNlDnDd
         NS3w==
X-Forwarded-Encrypted: i=1; AFNElJ8RfxrFwAMAhHlCbIvAldKILUXijux2FCppSH61d9n+uZcDcKZrEaP0LhFBwRIJJ2YRnb3UfvM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlQSRGlvRT8rFkctitV9Kwa8TrcygGfkM17RoIRUQfHcvrO1Pz
	vqkLPdHqqZFFxgXZWYdogphGw/pGHXT9Qy4f6PblTAWWu31YViR4Cve2fh6HTJuW2s4vbRPuREC
	H1ogqqh6UKf0LAiNMjG1CHg4Ofep39t0NTCWlrwnFg88Dx62LPNoSmE9NqJtvTKJLZNz+jMyY
X-Gm-Gg: Acq92OEebsfuw0VGV6dUjq/8W8TRtPev0wCySN7CMJwtvSCg0aLcsJczYecUc6Goyq2
	FDxM8dSRc9VvqnJcRfYhFJ1sMAiJL0nRh27wSCCJwei3xCmkjxURRzaZp2Z/hwpdZ4NQTChGjSw
	J2qMPksqre1wOeh+IxOLAnES09p2AtSycHjZlPeEtz6W/EdY9SQ1bwm6HKUN03aLlh65KcVqJ4z
	5QuL/+xpIl6rqJ8YtDQvZ0lY40TH9fvs5Fl++5oec1hjX+w1TuJ2AAFVxw1EYno/df/ktSSFfmk
	5TwQjbFfvJgbDNufOtEU0wSBuz5obSqhmOCSyxgU+VYAHaT1zZ8yzn6EY/SmnwEVGMtzvyNrXZV
	lKPL3ButFHtNKXDucQ00DmWfV2c6WjcDxptHuQsTx05Nppq4PcogDkmOPeohrkeO6NsQFvINw
X-Received: by 2002:a05:6a21:2d42:b0:3b4:6265:3788 with SMTP id adf61e73a8af0-3b4ccdcb24bmr24335884637.21.1781003171117;
        Tue, 09 Jun 2026 04:06:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d42:b0:3b4:6265:3788 with SMTP id adf61e73a8af0-3b4ccdcb24bmr24335834637.21.1781003170595;
        Tue, 09 Jun 2026 04:06:10 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4e59sm18488529a12.16.2026.06.09.04.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 04:06:09 -0700 (PDT)
Message-ID: <c5105488-7ba0-4acc-bd65-f3d53aa900e5@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:36:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix EAPOL TX failure caused by
 stale tcl_metadata bits
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260609-ath12k-fix-eapol-tcl-metadata-v1-1-d47e6f90d4ee@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260609-ath12k-fix-eapol-tcl-metadata-v1-1-d47e6f90d4ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xFlYYQ8WX9bsVuUiHOmxIEvhh6B_K8jL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwNCBTYWx0ZWRfX7yrMrTHFPHcE
 K8dtw4gcRuEP5aQ0LFiiubAmW28ny/MA7WxouiNcZnEeiqvp09wtl3drC8u5R2nSFALVaGochOZ
 LTvrLykekotFoQRwXwEieMdp533HfexXgZgoQ6uVn9OhDquAco1TmvCarCdIyEtPzjlQVMtGTJv
 xIBeFSoRDTaBl3axi7Fn17QK9lavYMhbhNmAplvuzrkrgKVwRROrp0K1lM3Glxgju8MdmsPu4Ys
 cQFMh094mQNUpXHA7gCQbONR7sRRVIdf6RNDSV2a9ddYxCD2UUnGiel7c+kzum7cH/km4AFkzkC
 xvAMWRqoECHM/q9BQA8oATR/j2UkOcVsK/sdar8+75KrF9cLIQ5Thc5WOcDS7nQkHMQ1abDRg1c
 VU8HS3ihDXQ1wZfVj5Clr/UC6VKeEgPpPociiNzlT41n5Q7Cd7Ysqxrns91bNKYRJ+8/RaXcwUY
 AfXd3Hz7aHfDF/95H/A==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27f3a3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pbvH2K571lt4oqL5DtwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: xFlYYQ8WX9bsVuUiHOmxIEvhh6B_K8jL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_040613_716463_3A8F7EE9 
X-CRM114-Status: GOOD (  15.38  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 6/9/2026 7:40 AM, Baochen Qiang wrote:
> On WCN7850, after the following sequence:
> 
>    1. load ath12k and connect to a non-MLO AP
>    2. disconnect and connect to an MLO AP
>    3. disconnect and reconnect to the non-MLO AP
> 
> the third connection always fails with a 4-Way handshake timeout. The
> supplicant transmits message 2 of 4 four times in response to AP
> retries of message 1, but the AP never sees any of them.
> 
> ath12k_dp_vdev_tx_attach() composes dp_link_vif->tcl_metadata using |=,
> but dp_link_vif is embedded in struct ath12k_dp_vif and its slots are
> reused across vif/peer teardown and setup. Since tcl_metadata is never
> cleared on detach, vdev_id bits from a previous attach remain set when
> the same link slot is reused with a different vdev_id. In this specific
> issue, the same link slot is used for vdev_id 0, then vdev_id 1, then
> vdev_id 0 again, the OR yields tcl_metadata == 0x9, which encodes
> vdev_id 1 in the HTT_TCL_META_DATA_VDEV_ID field even though
> ti.vdev_id is 0. Firmware then routes the EAPOL frame to the wrong
> vdev and the AP never receives message 2.
> 
> Use plain assignment instead of |= so the field is fully recomputed
> from the current arvif on every attach.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: af66c7640cf9 ("wifi: ath12k: Refactor ath12k_vif structure")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


