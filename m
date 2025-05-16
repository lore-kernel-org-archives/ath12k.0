Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF124C3ABD8
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90slheclqHTeFlUy8kLs7MTzw3fm6eIhnYeb+zUtODQ=; b=3gIXgqhzY6PVPDMtkn5bk7VKu2
	FUEwBUjH2aUw7oO2jnOc8Fh2XhYuwLufcfgTqB8yj9Lv3hsSplaAlGko+TCcftV6qh9piE/Hjt2Rq
	vP0hS4Uo8cuw+UHTUoA3NkZvGRH7nlmHSy4PScrQyxWoLeMgyK34nvCDxXmTYpsUivBRMkkR+/hCS
	4cERkl4mqDDVguXlqdk5jaW4iUg3+k6P9h2i3waTXT7R3J7Ngi1K7WvRW77ej8NOi8RaIxv/CWukx
	fcvJ/UJy9Di627j1oE3aVXhBKbbRLzUnDxUVibwQ20Iu+tiV01UYKDx9cfC43dw8tQdbirJoCgnew
	fFnBD7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwzw-00000003qv1-2jMN;
	Fri, 16 May 2025 15:29:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwWr-00000003l29-42qy
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 14:59:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GB5n4m000334
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 14:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90slheclqHTeFlUy8kLs7MTzw3fm6eIhnYeb+zUtODQ=; b=HsMV7N3MCu1q1T5B
	bKezIwRscC1Nqfr/1En56HB5XBQ4yewcbBMUReoLYHSo+THMPx0Vkn92M9rUvFW9
	LUGgb694+Rr7LhG2Bb+D8V50MsjtpoWOk56mqu8vjvda9RbP06dsYEOPyxjAJHbl
	iemC4vM9SgP7Fg5C8EpGM8gZJWyh7Fbr1qKF2+6W+PgDU4Zo0cDplueiSTw8WQBo
	BEAzhGDyO0YI/N0AFFYInCS/p9W9B3Xo85JlfueNraQkgGkuTS50Ey0diHI3f6/O
	8Y/A6xQDcMjggGZ+Ugz1BjJa2Db8bj7iaZGkMbJnib+tcKSNyXofBPs2Vlxxweij
	kdthvw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp28fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 14:59:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231d13ac4d4so17196475ad.3
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 07:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747407555; x=1748012355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90slheclqHTeFlUy8kLs7MTzw3fm6eIhnYeb+zUtODQ=;
        b=rnKo4TIyjbLzv2W9LC4UAiKhKKBM0xQz32Ns1c6WDGaygAhxjSQiP3Im6vPWqjs8I6
         C+emNaALSIaG3kBmkQrMHdBj6zwZ60Lrir1pLTA8V5WrzeC91UsDBYfmgSc816XGUgRa
         abnQ8rgRVwhX684jH2OyU7cpA0S26dNqmSKWxgYNrfgRdeN0w1WK5eSqRIHpEiTxJ5Sn
         h0jbcYNqYjTaDut9ojPuIs6qtaOlJVJ9wc2sbTw3o0fMbxJQsQWnndKX7lPLUWjsjPsq
         L26kLHUCEpSJ/vMKQXJm2XvS6FRPO0p1cHefS4wifCsrAClSLGznM+o9hjDgbLQUyVPa
         F5pw==
X-Forwarded-Encrypted: i=1; AJvYcCVe5abDIR42wTitCtZzVXPT4fwoNmrKK94YWBN+kPTsTszqndIo8Y69Cqz9vGUFb9mc/wUKaIA=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr6IUQbG8xYdd8hZ6LNRQdUEfohXiA/Lb1nH8VY8F53THEpJ3q
	sNEty8dTMZq8CA1+/AKEcHWS7xGv9v92v5DMjIYKHrV+6TEA35bCpNtaWclQ3ny6UjAmhCFC7gy
	skb3Kq2oaaW5kJxyPEeXidFGI/a1ttHlm/L4jJa11wZ3kT3dBcymDkheqFg7KoUfV
X-Gm-Gg: ASbGncuuuPDoDG3CJIVAS4clOYQ1rKqyLYgPHKzfQ/ylPdIjzP5RUctuVstOfC3V3ae
	7u7FJAa4TCO+Vp4xC8P6A4MGklaKMlHlF1W/tmfRoFwaGjP5rvZCBVEvHUzXb0vJ81IzQ7bM+/D
	JDHIBTMKuocrr3xR6WZBYGklrnXeFU9EKDX0Kq/rMe7V7HiL0nuIneFTrdgMGvv56ii7N6Le+W8
	395A7/Q5GaBzyyeyQALwXA5gD/A98f50cG43AJfM9x4Jw/4gqd+YD7xLQcO6fRyN+V6T5CKUJCl
	Tq8o9EWiOXghz0yot8W0MJXw++qvUlaFy5FRo9mUOF67acyf3xtJ96xofA8siA==
X-Received: by 2002:a17:902:cecf:b0:231:b407:db41 with SMTP id d9443c01a7336-231d43bf736mr44889555ad.27.1747407555434;
        Fri, 16 May 2025 07:59:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9QUuer/H2zXnlCjjwWpwBnKAXckxeSB/Cp2w6YMZtX7hgsrBVAG8oDxbzoZZTSRVT91y46w==
X-Received: by 2002:a17:902:cecf:b0:231:b407:db41 with SMTP id d9443c01a7336-231d43bf736mr44889065ad.27.1747407554961;
        Fri, 16 May 2025 07:59:14 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97798sm15328575ad.147.2025.05.16.07.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 07:59:14 -0700 (PDT)
Message-ID: <f6eac84d-3d67-4f99-a9c5-a9f03d748010@oss.qualcomm.com>
Date: Fri, 16 May 2025 08:59:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250514081447.279981-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250514081447.279981-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fOYmUF2-d_L0B0oQFYeMCwRm1SF30fXi
X-Proofpoint-ORIG-GUID: fOYmUF2-d_L0B0oQFYeMCwRm1SF30fXi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE0NSBTYWx0ZWRfX1PAPu7g0CWxy
 bzEBGqMWAKK6e2Shs3e9H0X644sa+KbOL4DJ5wDhQbXrEdEJLqUliNA0519rViDtV8J7U79Play
 wV6TzDI6AaEgiECCFM7zf+o+e4RM+QH+V7sz3SSY4CTLAdB4qmGkw16A8X3phTiXrCJRPjVchip
 E4kvrGu/omgobs3V1fmL5l51yJ0R9LGCq7Jt71nsAB63AAr1HLZ1OmHGOPxSRS14rRHdS69ogYq
 yjq2MCmC3qaL4x7TbGpY6yM/jpwmITjdfwcbAhhnemMnslf78LavpOHBXnuEyDog+WKPf8VAX6w
 wM1LgjX6HfKyP2Jlan8K2oyFb/LVlQAMS0p4czGt6w3dg37fAFJ5sA/Xt+5Cr/R0/YyobYifjkU
 YYsjJtwVFVA6FBEbq8mOtn6+Jx3bOzbcC+U5vre1T6OuucKKYaiura69vX6nyZxnxrjDmcGq
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=682752c4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=rJ0JV_LFfDDBQ4JBDEYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_075918_126137_B6EF0808 
X-CRM114-Status: GOOD (  24.99  )
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

On 5/14/2025 2:14 AM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> There are two allocations of bhie; rddm and fbc. Optimize both of those

There are 3, but you touch 2.  I just commented on this in v4.  Only 
touching two is fine (the device for the 3rd one doesn't need this), but 
the documentation must be accurate.

> allocations. The rddm is of constant size for a given hardware. While
> the fbc_image size depends on the firmware. If the firmware changes,
> we'll free and allocate new memory for it. This patch is moticated from

moticated?  Motivated maybe?

> the ath12k [1] and ath11k [2] patches. They don't free the memory and
> reuse the same memory if new size is same. The firmware caching hasn't
> been implemented for the drivers other than the nouveau. (The changing
> of firmware isn't tested/supported for wireless drivers. But let's
> follow the example patches here.)
> 
> [1] https://lore.kernel.org/all/20240419034034.2842-1-quic_bqiang@quicinc.com/
> [2] https://lore.kernel.org/all/20220506141448.10340-1-quic_akolli@quicinc.com/
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Tested-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes since v1:
> - Don't free bhie tables during suspend/hibernation only
> - Handle fbc_image changed size correctly
> - Remove fbc_image getting set to NULL in *free_bhie_table()
> 
> Changes since v2:
> - Remove the new mhi_partial_unprepare_after_power_down() and instead
>    update mhi_power_down_keep_dev() to use
>    mhi_power_down_unprepare_keep_dev() as suggested by Mani
> - Update all users of this API such as ath12k (previously only ath11k
>    was updated)
> - Define prev_fw_sz in docs
> - Do better alignment of comments
> 
> Changes since v3:
> - Fix state machine of ath12k by setting ATH12K_MHI_DEINIT with
>    ATH12K_MHI_POWER_OFF_KEEP_DEV state (Thanks Sebastian for testing and
>    finding the problem)
> - Use static with mhi_power_down_unprepare_keep_dev()
> - Remove crash log as it was showing that kworker wasn't able to
>    allocate memory.
> 
> Changes since v4:
> - Update desctiption

While I'm commenting on spelling, "description"


Code looks ok to me. I think we just need to hash out some of the 
documentation and this will be good to go.

