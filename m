Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C286C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 00:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5YqGTWadi5yBMHeS3jpvfnpejEaTq3yOX4W/eiD4Pk=; b=MXVsKrmPkpvMzF1v4WZLD9/Xes
	nS4MzKqOPvekTOs8+kcM/EpBe2CEKfEqpZ9ZNR9kS3qcpt+8p0KeARHaQky3m3i9rY2HF9BIoI1Zg
	csHPpGmVb0yxm6fc4aMkceqsa+KyMs+LUU+9aXpQ0Blc3+nzRItz36QrCx5a1pjsFoH+FPozlYpLn
	4yDXL19FDJjewXu3qV16o3Bjq8u8dqFLh29FMRHKnsh3UsYnY365QW/BhmLf8V1AHpZ38NRji4yS3
	Rk1oazWjRJdwCcqa8Z7n5Eeu1q67zP8ZDGw8uG3NtL/Ff9yKs2svRAGTN8rlOFCx9YuSzeOY2rtrH
	BUq7NsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weMMr-0000000Fbvl-2B1U;
	Tue, 30 Jun 2026 00:30:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weMMo-0000000FbvP-3ksh
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 00:30:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TKfTvY4043207
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 00:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5YqGTWadi5yBMHeS3jpvfnpejEaTq3yOX4W/eiD4Pk=; b=ZHakZSkXZoi9NX86
	AwRPrWEUcrtWXeVIEO697NlCUOupGGQSJMltVN22+AN4mDp0L5y7x8chasa8jN7X
	he2z56rD/plItiLO0dOm0BtWz7jOetEXeTRAZu2m76oYMHQHENSd0EVA2PrF09oM
	nNEXdbVQfCUiHMwzZ71VFvgPXbzEnafm0/5gcNIw8KHAMEZoJYJKnUvtZxmKCZG7
	VB9mvo8PIWCXjrJ7zEBdl7zCbZWv6QuXiiRnVaucvmCYr1ME8cFw1Qjl8GwJUqbh
	eHCWb+skuc4wvkmhu8ARl+osdXHaoPUtxbCiFxJhiFK4WIaC2rH5yKgRIwOyecfd
	tU1llQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s3stk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 00:30:21 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-138acbc0e69so18547936c88.0
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 17:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782779420; x=1783384220; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5YqGTWadi5yBMHeS3jpvfnpejEaTq3yOX4W/eiD4Pk=;
        b=LdNYG2kmG9xaMz+ZiiP/ivh65bgPpQrdZ0K9MbCIjpqPdO837iPBGxDt7Dmy3wWmFP
         AO5+PtDijgzcvj+tvnO+8wuiBq9Job3HBlv0SjUzMLVRwlxuIlTac/Q1jBh+malg2hxs
         1Rk2LgqolCDbU6UFMnXFAa11sJ3pX1ZUU5XVQ4kyuK39uKkkyMsHGcRYFq9dyGMkQf93
         8O8s2CYEVdqXXWyGTA9aO9A1FcNH0dfb/c0xolGHD2vaCmI3x/wkT90TfxLhbdNzumE6
         bHPLRme+IEDpY5ah9SwovETL+fbmr/03fw2jiBNZAmZDMQkjbnSXc4lA3fp07mdOelWd
         r8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782779420; x=1783384220;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5YqGTWadi5yBMHeS3jpvfnpejEaTq3yOX4W/eiD4Pk=;
        b=EaFyx99sbLRqGDxRESgE2w8OugXaieCA9Xxm4PdmVtzNEYKg/qwF3hGn2b31q9W+av
         3yw6+2BO78/aEbsNWOO6G8MT+1/yO0qn9GKDHnTVDeDA9htO5t7wBmucQKcK6D9zNvn0
         Ar3WVMMiwr1L8zYan8j5AR/UXHvRUe8gTBC7RO/y4O8beGRjmzt/V3kCZd4RZ2NeUCPG
         QUCRQXcEahg89Tw4OpILZUw+39EfrHLyiRHO2KU7hqvJfXscesdBbVnsg28mQQp2vm4F
         Aa7G7lDzNOvf2inUaOQ3yPl31VsefR2ar05s6K6Q6uNhlZC2pH/0reS7sq2tolzzAdC3
         7GFw==
X-Forwarded-Encrypted: i=1; AFNElJ8BIIOrY/TI1TTGfT8SpXLY9VzBVzQ18r8zZt6A1oxAzidJ8wDVC2OLP6y2190uNzc/m2a8eUk=@lists.infradead.org
X-Gm-Message-State: AOJu0YylVWx+Irj1jnponob6xoW7DIQ3Hy6r1B1GgI2t2imGKZ9M4S44
	8RJDAkAdnAvzeGBrtude1F9KJkeay+9Hfpv8y2AbFtVubZGjKTuSGzGkby8z3WH345BAZ879SA1
	5UtAQtIdyv04J38JpODyPdzAcwqU4rfynKaTHRiz3KSlfpZIPxruZhPYBirnmsd2ge9vR1V/w
X-Gm-Gg: AfdE7clLMkvyJBY7lSPI1g02Sg+8Zyi2tOFv3ykcOK/k7iWazBjuW7OAkJkhM+zTy+y
	V1EsKq+Hax4fTkySDZUQ7NUjdPOzvoGaNF+wg7UCkSZhk3cHD8gdqm7po9e1ayf5/+yol7pMXBV
	5tN3yD1VPIRAlHCi/6T2fqoskbfptD3DE3TxFg/LNU0/Acuy1xTcLG5Pm7gEcikkKpONniXuZzw
	1bY3cbYxsBI3utdN6ujIlkQmnuryN/HPVBDV3mTbxmwzWlUDB7ufILBhtTjfUl8LWROMshJbDdv
	MWMzTWMEhYh3TUyMx1ltcrkgR2jebtWXn2xufJD4GjqXArVRgThhVd1y9AFcy0U4qn3F2KhcBEI
	muCe78/1b5X68B+gUqnPkslDaKpsxyZHrMWCh/fgYGMHlVlcVlq5m6/hLGRzVr/TF1fhu
X-Received: by 2002:a05:7022:2594:b0:139:d923:f8f7 with SMTP id a92af1059eb24-13b2a14191emr929662c88.4.1782779420214;
        Mon, 29 Jun 2026 17:30:20 -0700 (PDT)
X-Received: by 2002:a05:7022:2594:b0:139:d923:f8f7 with SMTP id a92af1059eb24-13b2a14191emr929646c88.4.1782779419481;
        Mon, 29 Jun 2026 17:30:19 -0700 (PDT)
Received: from [192.168.1.11] (222.sub-97-215-84.myvzw.com. [97.215.84.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2cd1be7bsm291233c88.1.2026.06.29.17.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 17:30:18 -0700 (PDT)
Message-ID: <7fd9e186-fce6-4c81-8aa5-f0de961fdefe@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 17:30:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/3] wifi: ath12k: switch to name-based reserved
 memory lookup
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
 <20260611033314.2330-2-aaradhana.sahu@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260611033314.2330-2-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAwMSBTYWx0ZWRfX1IX7uEaYUCAI
 SpiK2hxPLb729Ul3Fk+la1bwIQLn62l1db8nNHDPLgv/zL8bbKPtChMpT3i03pwqhqH6hXjDlYP
 Z6fmbiXa4vEnU5s2Tw+o9llKMB04bZs=
X-Proofpoint-ORIG-GUID: yOYndT56uC1ozrSj4-SXw1ULSVkoCc4G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAwMSBTYWx0ZWRfX+l9+LrluiTAX
 X74KBfhtR2rzQ6Behbi7TTg755MAJxfsbRFTdnUPt/wtwdEd5Ex+erzba7y4f+q42Be3WbI9nSb
 mMNtZeqHQoESIWAlXi0oiyO9NnvPnmaJF7tJ0QRRQtGfe0/NZrsQOBn+Uuwosgl3+FcpeTLzgj7
 JyFPmSBtWnN6xF9RDPGW6yPxhZB+MM6qhljlGnSmTxt8Nqt+rm+NeOgR3Ycm3dMhPDf9p6tfm0c
 0Q2HVe5XF5/wcnG2GKhYoPpvOjutU3Uus6v890eTxTniC7rg4XMUPWBOC/pFi44dTNcvCXMarCw
 +1w1nl/eIwc/+U619HHS135oiVANLTT9iCkABWUG7XO7FX+ca/WkToDMNmUjUaBfy1hN/lH0HXT
 CkUdptBTFH3tQR7gn+VwVxv3OFcLMVAL/QOK0frDiGzSuK0SxfeypOVRTbotfdZLtvuGbYdOQHj
 VC+UODyWd/fFOoal2zA==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a430e1d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=i4k25I72rCCN9bAAQd7+Jg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6mlMAM2_b4rmZgvfR8EA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: yOYndT56uC1ozrSj4-SXw1ULSVkoCc4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_173022_955740_ADE1074A 
X-CRM114-Status: GOOD (  19.36  )
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

On 6/10/2026 8:33 PM, Aaradhana Sahu wrote:
> The driver currently retrieves reserved memory regions using index-based
> lookup, which depends on the ordering of reserved-memory nodes in the
> device tree. Since different platforms define these regions in varying
> orders and combinations, this approach is not compatible and can result
> in incorrect memory region access.
> 
> Switch to looking up memory regions by name instead of index so it does
> not depend on node order.
> 
> Use names already defined in qcom,ipq5332-wifi.yaml, so there are no
> backward compatibility issues.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/ahb.c  | 18 ++++++------
>  drivers/net/wireless/ath/ath12k/core.c | 25 -----------------
>  drivers/net/wireless/ath/ath12k/core.h |  2 --
>  drivers/net/wireless/ath/ath12k/qmi.c  | 38 +++++++++++++-------------
>  4 files changed, 29 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
> index 30733a244454..695b605a92fd 100644
> --- a/drivers/net/wireless/ath/ath12k/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
> @@ -15,6 +15,7 @@
>  #include "ahb.h"
>  #include "debug.h"
>  #include "hif.h"
> +#include <linux/of_reserved_mem.h>

system includes should come before the local includes. I'd fix this in my tree
except there is another issue in the 3/3 patch so I'll want a v2 for the
entire series.


