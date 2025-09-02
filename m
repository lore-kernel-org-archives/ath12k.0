Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19937CA1007
	for <ath12k@archiver.kernel.org>; Tue,  2 Sep 2025 02:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQ91as11jxXbvAhop7414Ff9tsMvSa+th6SSKXrSeCI=; b=3BlfF4tnC+ECwOI2hkM1uE7m7U
	x5O9gB1HIvE3nWVfatUSGeAxMdRhyqrBaoQHe7DcCZb2zJm6efzReNyODM5nPrqWeYOwhP35qv5zD
	zVGB0V8MA1u8vRMV7QBgVhpyKRTpW6qWMFlcYPh8KApUEwRTx3ShF6Piox74T7mXmmHreOq6yFxIR
	7upC4FTr6vwoirVAWlNjIH8D69rtc9lWKCygKzWv+k7Kn5FtgZwhJjxY62QEnZNN5wRIcExhjCF3a
	rWTbUEOzjg/FE2z2xwYpVxnkR0DNA70BEuPUBxioTLsNERwqMTRDAO+cbg06h6treI5A0kbmQEo3/
	MEvIW4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utH7R-0000000Ew1C-3Nua;
	Tue, 02 Sep 2025 02:51:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utH7O-0000000Evzl-1Nf1
	for ath12k@lists.infradead.org;
	Tue, 02 Sep 2025 02:51:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822THIJ027558
	for <ath12k@lists.infradead.org>; Tue, 2 Sep 2025 02:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VQ91as11jxXbvAhop7414Ff9tsMvSa+th6SSKXrSeCI=; b=e8pOOdiU2s3BCrRo
	wz466c0XdIi5wpFkosykdxBgnMCcjUDlq0XE7CnkbH6AUUR8KQl+7dSu13bvSQdc
	pI4+5se9pX3jkDtSjMbDyy825vdTXP4Rh5DPNovKejSLCprI6Z6lTTuW/PcHdZ0k
	lxF7ptEgEV7lxMVgbI80WeVIksuDmb4WxOJu0viI0qVedushqg7TZRK+3qMuLwBX
	Pep9Qq/7o14AOt51Tvals/4z4TTTgTpYNB0xc9OWe9/qgd0T5YxlHRwMkdPnDoKL
	0KrEz/So81/E5O1oOlsDKZEiO/A7ojyNihNvgBhDbmBhpqV/i+2AlX4grH2n7lzf
	Xsi/1Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuxabv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 02 Sep 2025 02:51:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24909dffc72so39507655ad.3
        for <ath12k@lists.infradead.org>; Mon, 01 Sep 2025 19:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756781492; x=1757386292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQ91as11jxXbvAhop7414Ff9tsMvSa+th6SSKXrSeCI=;
        b=ozYf06mNuaIyFzMdfqoQyzhQTWwCqLkNPnU/0e9GrN+zeqlMIBKyDiHDov6tF9+PiG
         /4zlR4/UJGtm+EvgOjJWB2fTBftrNCW3tAgv+lb17I6h79AJkqLO14eQ0X4aawlYrMW0
         y5sA4fBXSKc3apjqDLN1apm6QSHufaJq+yC/lRJTU0JFanB/SFH2v9gd1yo86+5qhM2L
         yWqCOoW5PwxM5vQhO+YDos47ciRfS7fMKc2neyHzuWbGpHabl+gInu1cAvJObWlSWvqj
         coUauG+3r8Lk4ZibWR9znMXRtikwntIvQDwzbWk34my5TA9iB/+aLkmjZtr7zjfzmeGO
         6Cuw==
X-Forwarded-Encrypted: i=1; AJvYcCU9gjkgOM3/bnDPcguI/fvpL7PoGAhnVXDPxApZx0Hojn7LHkxj6B6YYsCnAazWFOcF8uHols4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCvT46z/kQAbSTbdT43CjPhnB7nYFTOjqWCcjr200Kg+Lo4ec+
	v5ExKEI/LbykpU9es1rH97Lm5ab+2Pj991SvCYdjgGprjz8Rpub0DxJSyw1MeCl4X9ymQGLQUjt
	DdUVZNSek0876uNZlO2uX9NeQbaWC3Ec7WpadIyLe/ZgKQdHZSF4FHJU6700QAOCJLFNtBDMWGP
	c=
X-Gm-Gg: ASbGncsj/i+AV61lCl5y9VJWx60BxseBaLuFOp2qZpFxHrGhB6lG/Ds1mkr+zsJIn2b
	GJ7O22QDVqI3F5KDHQQPSBCTxbYHCfRYCSosxBepEZGIngF98a8UjCa/4njBnqN98dIMKjOaFll
	8pEGZNBx3pKxbYVopvvq4YUqJToi742lQHLMwyQJgRCRkWANTo2WvPqjrTETa67KqOEH+qetEmW
	Adi+OjA0caJC91sh9Wxe4/w/EIfOi1xbsuquDp0in272UEYfuqNnsXDZA1Gnwdb128NJ0qpMX8N
	lNeP62Ccc1c8ClgHnyj6SNuMSAVqKtYlP2KohX2eapNseNvQqwV/iAfl0aFApRAVbBfFHWmee/5
	kpjAaibKHLGEcxJThLagRINxbao7RPQ4o4iI=
X-Received: by 2002:a17:903:22cc:b0:249:326:33 with SMTP id d9443c01a7336-249448dea03mr143974795ad.11.1756781491554;
        Mon, 01 Sep 2025 19:51:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpZ+5uITa2r/3CcXF98NYuwv7RsKeJfZNzkK6xHk0XITvxIfbxLt5bSOFHqCNB1o8psAfWKg==
X-Received: by 2002:a17:903:22cc:b0:249:326:33 with SMTP id d9443c01a7336-249448dea03mr143974475ad.11.1756781491086;
        Mon, 01 Sep 2025 19:51:31 -0700 (PDT)
Received: from [10.133.33.7] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490f755ebdsm112959255ad.26.2025.09.01.19.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 19:51:30 -0700 (PDT)
Message-ID: <623e93fd-73ef-445f-8519-d510d0c36801@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 10:51:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-mainline-6.17rc3-1-x86_64] RIP at qmi_handle_release with
 ath12k on a MSI x870e Carbon WiFi - mainline kernel.
To: a-development@posteo.de, ath12k@lists.infradead.org
References: <fabc97122016d1a66a53ddedd965d134@posteo.net>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <fabc97122016d1a66a53ddedd965d134@posteo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX1TYZK0VQ9SWh
 j+IGzoTANUDEwOQf8VUPVINCP7gIvEqzYI2ckN5ef82LABH4LLw7FrXCARH9SwNUVE9I6bR7JQA
 wYTPQ0q+VFYzIP1Zs/SRZ854w8mcALfwgnVcQqdLfELcB0n1cw7S0+i1So1W3R1GerszpTpPDzp
 kVUElwDQeTlqc+/1m0vHV7OwXVq4XaSKwUIqOMKO2o3uqnBkBKisFVJQ8DRzc/ZKYXHtTZfxv2H
 2s3NT/+oXiU+vNXJeWvEkupgugKU+fs79b5FxHNbfDubOLDKIsWZdwaX5PtUhRqpz7U7MSug5fR
 MHATEVmaNjx+vvEt6fcaZ8t5NUkk6R/W47y57SwLM9++r930/uCd84d5VUVtVynQiBOqnUshXJj
 ahmPUAfr
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b65bb5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=OeuxIFDhAAAA:8 a=_AGzQDloAAAA:8
 a=5FXXUk6PpCwY9C2ZU48A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=USl8sPKdY6I_7jokSFGp:22 a=16XsjWzRKMd84bghDgc2:22
X-Proofpoint-ORIG-GUID: VTRgvqkst9LmUYeibp8nY-gtZmwK6kC7
X-Proofpoint-GUID: VTRgvqkst9LmUYeibp8nY-gtZmwK6kC7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_195134_491061_E17C1023 
X-CRM114-Status: GOOD (  16.09  )
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



On 8/31/2025 11:36 PM, a-development@posteo.de wrote:
> Had the joy to build a new machine.
> I had to switch to mainline kernel to boot at all.
> Blacklisting with kernel 6.16 allows me to boot, or using latest mainline kernel.
> 
> Hardware is NEW.
> 
> Log: https://0x0.st/KH4D.txt
> Alternative: https://paste.gg/p/anonymous/52779beef5144f2fbe74be2673951f50
> 
> What should I do?

Could you try if below diff can fix your issue:

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 8d2839cf1de3..bc40958e885d 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -2109,14 +2109,27 @@ static int ath12k_core_hw_group_create(struct ath12k_hw_group *ag)
                ret = ath12k_core_soc_create(ab);
                if (ret) {
                        mutex_unlock(&ab->core_lock);
-                       ath12k_err(ab, "failed to create soc core: %d\n", ret);
-                       return ret;
+                       ath12k_err(ab, "failed to create soc %d core: %d\n", i, ret);
+                       goto destroy;
                }

                mutex_unlock(&ab->core_lock);
        }

        return 0;
+
+destroy:
+       for (i--; i >= 0; i--) {
+               ab = ag->ab[i];
+               if (!ab)
+                       continue;
+
+               mutex_lock(&ab->core_lock);
+               ath12k_core_soc_destroy(ab);
+               mutex_unlock(&ab->core_lock);
+       }
+
+       return ret;
 }

 void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
@@ -2191,7 +2204,7 @@ int ath12k_core_init(struct ath12k_base *ab)
                if (ret) {
                        mutex_unlock(&ag->mutex);
                        ath12k_warn(ab, "unable to create hw group\n");
-                       goto err_destroy_hw_group;
+                       goto err_unassign_hw_group;
                }
        }

@@ -2199,8 +2212,7 @@ int ath12k_core_init(struct ath12k_base *ab)

        return 0;

-err_destroy_hw_group:
-       ath12k_core_hw_group_destroy(ab->ag);
+err_unassign_hw_group:
        ath12k_core_hw_group_unassign(ab);
 err_unregister_notifier:
        ath12k_core_panic_notifier_unregister(ab);


> 


