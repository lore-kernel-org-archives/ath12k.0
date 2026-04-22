Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA03F94CBB
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 02:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+otJ0aJJ00Va4jp2OqKrQrKwOArOCOKj8wwK4/dtc8=; b=XtzS9QmfLT7WoR3nmfQPTcmueW
	W8eYKD32BpJ1ecM0RiphtAlbydIfPoeGaCfl3OtEmw4TPLgaaDwu878mKhS987t10UtHapfVX1oS/
	zIDNFP0mPnBEdTlkMO2azNByojH4iQJ7V1ASkSMSaEkvsW5YYl9I15c7TAiQWtWJv/fY50arGxD2w
	h9zUrMbixl5FSV3Z/wv2lxTxrbJvlr2vZXCXbVCGGnyE/gI9MiJzWGaQAZqVvxbrfMJ/fzMNA00M6
	IBznkxMoFCDKFvhg954dmuE933Y/JmXLzAwROviRfYqoEVA1qPLxpQ1xSvZyWpPJu8UE3LuuxhlQ/
	FWjqmf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFMvY-00000009UEY-1MkR;
	Wed, 22 Apr 2026 02:02:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFMvV-00000009UE8-2bnY
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 02:02:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZjvn3377463
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 02:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5+otJ0aJJ00Va4jp2OqKrQrKwOArOCOKj8wwK4/dtc8=; b=cyfdFLUyPaHRCRht
	UIA/OhVjoXKdfy5G3AZ4d57VPXTWKWrfYD9CqVDUHdt2X1Gbv/eIAlgV6D2MfMZ7
	ftx4Ce1xeRx5TwxbXe57nC97JwyKrGwB9N4qWnwOKUgBaqfHsCMP+9WurQhM8tB+
	h4CykvsE4GLTmoBLCWO47pRt7Gzrftk+/Zn2yDkk2ooFUfgpFAzZ1Bt5WSbmkxuV
	DaF8g5aECVdOWwSeeL3huc1TjbjY9R8+zDn0sbaD6vrKCD4HnZw00MuaLoVmNoUz
	Vzv+3V9NIUJCnO4UraoYGKlHFjXhrbpBZIy7PSPy3BuFG6mu1iX21C4NuEjGXVuO
	wF9HBQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng17n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 02:02:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fb969a4c0so5601728a91.3
        for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 19:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776823371; x=1777428171; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5+otJ0aJJ00Va4jp2OqKrQrKwOArOCOKj8wwK4/dtc8=;
        b=QsORRG1FL/ED9Ho3V03SB9uYpGZvh+9ddHuMJ/IPJkgmZA0md9ZW2dSPPyZFSAXM/w
         6SRS6O/VuDp63a0dL7qYLexobxnoYYIfEZ+hdJ4s+kIiQFWd//elEMeoSusr99NJSRKc
         ncFeFIhqqd9g7E9HIeJZpBDz/OaYbftKHwhxLheTgine1/fnwLBNCIZdKPeuK5hya7YG
         jRxRyyY5N2Y1nAzjZGphIEo7sRsUKUgLUpfQXL6CNk9axDXlR11fggKKEPdqdoeP8o2A
         f+DYxhn8o7gCfNX39sJNJ62ErNmHydRehaG3h/8ZAQKY2giiIspLs+4T1G33E/Y78ugH
         5g9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776823371; x=1777428171;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+otJ0aJJ00Va4jp2OqKrQrKwOArOCOKj8wwK4/dtc8=;
        b=aNuCfGgN8o2jM+ZL7Shtmz40AZX7hqno2offttsmvQUyZZhVAfssR6jfzHpOmnvykB
         YisAe6yxr0VqVnkO0sz+MQ5yrs0qzlD0TexUM28Ko5RKTaPiXNBiv17iPo7uQb/RP0sp
         Ei4fHfwpr896iGpm/xFfAP4UIySnaZ0oXxkDvde4Ve1Rg+Ep2J3Y9ivT9/ncFkJEJYoy
         7FAP1HNaX/Upv/0mlPdjSIODrP1bronNgxoeQy1vnjpcBXpsVHlMfnLlNgkEV6Wto8zn
         RfJUI5hJwVxLL61jCanlIch/2FItX/tGpwNpnLQ7QUCo7rDJgM7iV051KNIims1xLzY+
         wDKg==
X-Forwarded-Encrypted: i=1; AFNElJ+uzZxfaSXSEyjb7AnfW33sCRzedDt2dYa3GL/ZqupAEoSK0xuBf8oyYnmdISUtI/NiAp+Zq44=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuWS2dFJ4qaOYPMaA8nz8vwTsP7wPuPPAS/0Gpit5HvZ1X6kN3
	5yR3MD1Qti+BuwTtmMh8FLJR+KaOIAI2RbmVCmVjxgJGtlAmB8OyVTmZd6719+BpkGDKUT4hjC4
	wU87vSXjyWyORIfoJBGRn/ThExZol7BYbUEXSjbaR1UHBie463WvBRvpLuSHnYkYm
X-Gm-Gg: AeBDieuFNPHXQxhNRTxk50sq0IUFZ56awXfy3z5auToLMAL5Djjora8G2e9czDHqOKa
	9ap4CB2NSbXS0X6lAy7nKbeiQKGl0vD4WK0IBHqF+Zl9ibKfMZQodYImDpgSSiXmxKVIBH9qdER
	3xSffoVwxo/ZzZDejKQczC13eQQKpHA495qs6BiTauJTE/ws74glfPYF0vHLDMi7zR0cqhKCiPw
	l1h4w/eKQYxK+86pdHm3pERoB/HSJSJwhLAaE+BiXkANAP+JBZURKKZitzCPKcJX7crrk6S/uUE
	hFLjO54mVDY/xrVi7brWbgXnsE2b1KSFNFcaZ7RH1mTSr8LOcFUMKTZD0CczA4PTynz0WoQt5rg
	JnPjA2j3GBvAaDq63W1g7s+bpUoVX3jLTkil/pVHTyO8JvSYOyeTEgMjb5Z+Y9LbYPh8BijgFGQ
	hDgVsnpgEVe/wnaFksnzsFG6CkWD4yZg==
X-Received: by 2002:a17:90a:d09:b0:361:45df:102 with SMTP id 98e67ed59e1d1-36145df0c75mr12547183a91.17.1776823370873;
        Tue, 21 Apr 2026 19:02:50 -0700 (PDT)
X-Received: by 2002:a17:90a:d09:b0:361:45df:102 with SMTP id 98e67ed59e1d1-36145df0c75mr12547160a91.17.1776823370211;
        Tue, 21 Apr 2026 19:02:50 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140feea38sm15235217a91.6.2026.04.21.19.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 19:02:49 -0700 (PDT)
Message-ID: <fc552f09-d330-49f5-882c-fffbd0c5202f@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 10:02:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/5] wifi: ath12k: thermal throttling and
 cooling device support
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e82c4b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZeLpQyFM_iFLYNy5nMIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: RFS_mp3a-u9H3TwgyFV6mUT6sSoyx_kQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxOCBTYWx0ZWRfX0Ex7dVAf1VoR
 6fYWfVLrcY0iI1BqQ2WIDsr6L0OCh5ppuZe46NsImVYYcVUr4wm8b3eKYCZHp9ONqWVaCoFKEn/
 /+ktMynAebf89AHzBA8kJEqq93JP4t5QVkJBbJmCxhrCo132QiK37/XdmT0vF5kycZTRPXWwXVM
 2J4+jkxU631p6Lp7faOBn00Fd5SL+1AP906UYitjaurcbBNgW0uDu1bglvcm0qhAMJNKjIvSjcX
 H0do3dL7P7aIGy/ZiCafu3pf7gniwZMmvsqCAzlj9XFWvKiYUy0d5lue9ZGIOMCbcKr/4IyZ5Uu
 QikW1ogZPbZ4b48UoWT8md8mP3emAm25vfsso+MWnTA7FluIrMVMCR7ByppXBLTw/xO4NRov7QV
 ED4JzOpzX2dNvhHl/AhPD/Bp/tpRmQUZjmY0k797pLp7OKa8V/J6+JR1R5Bkcfet841y0n+oE69
 e+LW6b1AZEKXN8Qy8cw==
X-Proofpoint-ORIG-GUID: RFS_mp3a-u9H3TwgyFV6mUT6sSoyx_kQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_190253_811656_289E6DB2 
X-CRM114-Status: GOOD (  13.91  )
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



On 4/13/2026 11:38 PM, Maharaja Kennadyrajan wrote:
> Patch 1 handles the firmware stats event so we can track the current
> temperature and throttle level per pdev without spamming logs.
> 
> Patch 2 enables thermal throttling at bring-up and programs default level
> tables to firmware via WMI_THERM_THROT_SET_CONF_CMDID; the driver picks
> IPA/XFEM defaults based on the firmware WMI service bitmap, supports 4 or 5
> levels as advertised, and only fills optional fields (pout reduction,
> tx chain mask) when the corresponding WMI service bits are present.
> 
> Patch 3 refactors per-radio thermal hwmon cleanup to reduce code duplication and
> ensure consistent cleanup across thermal register and unregister paths.
> 
> Patch 4 reorders the group teardown logic symmetric for safe thermal sysfs cleanup.
> 
> Patch 5 exposes a thermal cooling device per radio so the kernel thermal
> framework or userspace can set the TX duty-cycle off percentage; writes
> are validated against the throttling state range and host state is kept in
> sync with successful firmware updates.
> 
> Examples:
> echo 40 > /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/cur_stat
> cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/cur_state
> cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/max_state
> 
> v2: Addressed Jeff's comment by rebased on latest TOT with wmi tb - alloc and free
>     interface change.
> 
> Maharaja Kennadyrajan (5):
>   wifi: ath12k: handle thermal throttle stats WMI event
>   wifi: ath12k: configure firmware thermal throttling via WMI
>   wifi: ath12k: refactor per-radio thermal hwmon setup and cleanup
>   wifi: ath12k: reorder group start/stop for safe thermal sysfs cleanup
>   wifi: ath12k: add thermal cooling device support
> 
>  drivers/net/wireless/ath/ath12k/core.c    |  50 +++--
>  drivers/net/wireless/ath/ath12k/mac.c     |   9 +
>  drivers/net/wireless/ath/ath12k/thermal.c | 252 ++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/thermal.h |  35 +++
>  drivers/net/wireless/ath/ath12k/wmi.c     | 108 ++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.h     |  50 +++++
>  6 files changed, 447 insertions(+), 57 deletions(-)
> 
> 
> base-commit: 9a4f673eb08d2a7713b258d671b4a45f2a6e68b7

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


