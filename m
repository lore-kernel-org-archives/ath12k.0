Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD8ACCF9E3
	for <ath12k@archiver.kernel.org>; Tue,  4 Nov 2025 16:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQrP5WHqap98WOxR8qOdXIEhS6MSJIDFks5mJnLwaVw=; b=EoL3GNjrbKpHQXLFoVM9i92nWU
	/f3zDPJUUlOQD/+I/rKL0XYj6pwI04tGqfFuggdBb6yaHIPUlJ5hi8EtEYTiP6Z/x7xJQRn9MnEfu
	WdvcgQfXjoLtvIG1EgH0HAyPAbkDfEpw6umSwWS98CQVKP7O+ATpX642kyBCX2LRfaWzdDVDu0IvO
	9O4nvpu38+OxTx3Yivz2lfyUsGIH5JCcpLjc+2n2dwgCPlyt1pEuZkVlY4a3UK/VI3bAA63F7jIOL
	nlquqvbOx6a26XtSSyzWoQtUcfhTWFgQSc7uG1xTCcYs0Hn+csdsp5xLZOovHsJseyV5qoBLxFWcE
	VNnQzb8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJc8-0000000CAM7-1q68;
	Tue, 04 Nov 2025 16:10:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJc5-0000000CALd-1rjS
	for ath12k@lists.infradead.org;
	Tue, 04 Nov 2025 16:10:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4CfTIp2048852
	for <ath12k@lists.infradead.org>; Tue, 4 Nov 2025 16:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZQrP5WHqap98WOxR8qOdXIEhS6MSJIDFks5mJnLwaVw=; b=cU8IDiexAHmddhGt
	arumR01Mc1lRaS4Y0+PoPpDBZQErxl82MK//gAarv/dAFUEaJM6Wlp4xkOAQVG8h
	DjYU7a+rosko4HfX5aqTTH2XDjRuN1QI+Op8FsZYbbNxhngu5ltKnqe6CfequfSK
	SLO4IFOcHSVRwimdE4j8abJnODPJLj5vbD48t6uEj02VbNARHk83q0BkSzSEYfCg
	grmu6Ey1P35kbPuYDvmJL9pf3Vm2V8+vYUs2aJBr+qbOQT0VrXhITVxQpiMYJvfJ
	78krIdrGxl771QBNsumJcU+ICAWDJylF7/F8NSzHtFwC+xdFfnlrDo1+vXsev2va
	f+aksw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7f2511e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Nov 2025 16:10:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7aa148105a2so2372929b3a.1
        for <ath12k@lists.infradead.org>; Tue, 04 Nov 2025 08:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762272626; x=1762877426; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZQrP5WHqap98WOxR8qOdXIEhS6MSJIDFks5mJnLwaVw=;
        b=N3pVxi/LyRuaugAhJ4T8W8qbMRW2XLzWEnBbOJGiLr2FR9163HHg++aN0hMtNfiZEh
         z55RQWcLKSdcbRHZmqnDo8Fkh7wbbcJ/pwlCIuL64GIw3x+Ewtuy7oVaLAsov+eqv/+3
         PGerAKlqoIRllcxtXYepbR6uVGk6jEEa5ZcD4YdEwHWCDuWjZJ/4TxYeQramT+UpU5li
         QaQdY41l51ov8M9H5yFTuBYc979MptdfBOLplPL1JoBeI9LstLVAhFwT165aYqBzl1dL
         rGElhzQ7JuTJnC150aOZc8kXAj45SNMqFAqIc1rUoTalp2Kq2yjijQNPzzFOxg6SbgvH
         TGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762272626; x=1762877426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQrP5WHqap98WOxR8qOdXIEhS6MSJIDFks5mJnLwaVw=;
        b=JcQU/nWlWvdpFmXwd1x2x0vl2DjWla76/GzSReV1cb4uD0m2Mn8cbadBiztHcbPuGx
         mYgLDuM/wBD4aKdT91h/eSTFvFUgtxyPZWfMK5uytw7adNs0sFRuGnEAifdtUNhFj9xo
         WkcZZmyM8YrY+J7Wyrq0Z0Zh6JtOFon1FjuhZRVKMaTlh0XmOKPvElL+AWLnvRyT/F9H
         F0U+BpoVdlyrQxu4UlMv/5vWdMmiLfZAJyUQs9bhnKuxZib2Pay00ccg7ZHy/PrITxsP
         BLoQUXFx3vKvECJeTNtD41vSePjPTIb8HlaeK3qu7Nqng319PmxYDfffUfTroteFrW+m
         62aA==
X-Forwarded-Encrypted: i=1; AJvYcCUPOXogCuRmxtar7mW3XtH1S5qQPThWIjw344lnxivoLi6A1m5SjguHzhue6yhC1Q63tV3L7gQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzcyWjGh+l6oYvOietcZ3Vx7twaczF2WYsb+1K0w32vZaYmDQG
	NKrXLoyi52+arq8pXfqgxuVGw48z8ffeSQzd2PXfVKe5aoaiOX6arVYcoZkmsUzKmu/n5uQDxTr
	ii86vLzoE7KD1daL0DaFM2sbyFz6gbzo5HMOY33LIAUBDapeZOn7oLMRqgi5iS9Qa
X-Gm-Gg: ASbGncsv0Alb6VS3Y2cvNxmrBBf81om3q/QdDMqCUJB5TlSQ4Sp8SBkFbHENqh5VdS1
	tygdFt7v43qCrUz/lyoJBODXN9bUDd4MZaNim1Fy6gpNFut6aySF2QdbfFzy6n578Wv2Y1HTBwr
	pB9Uy471AoxrnmftHXTNUGmNblEc9aOYsjfFi6cylVfVJuKwOHRsX/6y62NfD3z3JHzZ60AbRhU
	8BM5MDwVwQnzzDLwPjFlM/G7QC0kqov1aicpij7ltCaQCZxLTHpMNLpBOYJ0JUKpbuUUGjCMYZh
	v1p1XZ/hrmgRqO0RBy5byYcm4MQEjDV9OonuDbiSpOQKREDtw0lVJpoliT0ASl5PwO/ifHwNJvn
	U8gjZ0UyqHv8CjCDYs0qlm2arvF/6yxyEh23e8PNWSTXTnowc/ls=
X-Received: by 2002:a05:6300:2109:b0:342:6c97:3680 with SMTP id adf61e73a8af0-348cc5de256mr22035819637.53.1762272626404;
        Tue, 04 Nov 2025 08:10:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnDuSVihu0019z7oy+sRp1dedKuJLH1z+cP8yp0FcauqMuZpGj0DFfD3qXi5P4WV5PFumEzg==
X-Received: by 2002:a05:6300:2109:b0:342:6c97:3680 with SMTP id adf61e73a8af0-348cc5de256mr22035758637.53.1762272625750;
        Tue, 04 Nov 2025 08:10:25 -0800 (PST)
Received: from [192.168.225.142] ([157.49.219.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f2a80459sm2808606a12.15.2025.11.04.08.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 08:10:25 -0800 (PST)
Message-ID: <f4db2511-8aba-7fd0-9ee7-6c27fc3afc23@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 21:40:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath-next] wifi: ath12k: do WoW offloads only on primary
 link
Content-Language: en-US
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20251103-ath12-primary-link-wow-v1-1-3cf523dc09f0@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251103-ath12-primary-link-wow-v1-1-3cf523dc09f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dNyrWeZb c=1 sm=1 tr=0 ts=690a2573 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=UfEK/r8AT5XTvLeqrvTvgQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4lmNr4T_BIov7qbIXHMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: G2fqd7KEIz1AjERDOmpbguzo07kFLeko
X-Proofpoint-ORIG-GUID: G2fqd7KEIz1AjERDOmpbguzo07kFLeko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEzNSBTYWx0ZWRfXxWr9QXAiHfBW
 DCLPT8A7kj/Z828BF5lxe2Opooy+yhkCnHBNic7pIvU5SbQpzR58e3ytyzdT5ODg5+EDWJdbBVO
 t5JozQBIevIFkcb2S0AAR+KaLfy+kLsvWANTx09dSkkF1o3vUbi9I5YK0J5PbWI9K2IrxPE3nfa
 zGyv7ZCbMjyy0/J9qrLz7Z2oK+V6Ctz59qO/MwVGiHaVM0tqGlGN0OotyUvamr8JpvLWQON9yUP
 Crnk1qeNKDwEjIGShV1tNUX/8LvatI/0D5dMX32lQrzija73RnbUCbMAZg4fXDvSplha160TYS6
 c1566HpUqOApNLDoSnEvq6f2utsOtqaRFv0N4dq52+bjOmnHAZ0sLGOY906/4eOk4yFSRkvrt+F
 CFRUZ+Qb6C7x8XKVwrveWkIIblkypQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_081029_625766_3296028D 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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



On 11/3/2025 8:14 AM, Baochen Qiang wrote:
> In case of multi-link connection, WCN7850 firmware crashes due to WoW
> offloads enabled on both primary and secondary links.
> 
> Change to do it only on primary link to fix it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Fixes: 32f7b19668bd ("wifi: ath12k: support MLO as well if single_chip_mlo_support flag is set")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

