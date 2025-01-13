Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAD9C02180
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 19:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjtjoV6Lsl1jRuoL+2xlFjDLFwJ3AA5fShbdt/8gqqM=; b=kfj7HGuHiy0i8Gry6FMoxe4zCE
	oXqKN7X1BWUQZre6baCLjG9/PX1sC8cdMR6uphlZnvZDnwh+eznCO8/rrSVjlJaY8YaYrzjX6zOgw
	n02uleB5fsmi3Dv2WVUYF3+u07e6M/iGSj7UlwwKoVdxwywkd5Z8zc8SOZ7LJkoXuJSOfwwIZIl51
	3JCZdKbkZrMrdkqiKLuCEdlO8gd+HwkGaBPR30f0NnfDgKk4vX5CB3DzJxq/ojOZHAfL2jPVc2L4/
	SGmrWVIwmdIe0T9WePCGGr4enRIC1VEs3ley+fBEpSkYdHmWpeUfZ5l+SiAd10kJFit4Y6EmSrb11
	Z9zcQ2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPlw-00000006JqT-15HR
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 19:06:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPlu-00000006Jpe-13kQ
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 19:06:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DDWaGa007221
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjtjoV6Lsl1jRuoL+2xlFjDLFwJ3AA5fShbdt/8gqqM=; b=btsOp8PLn+HJ5utU
	8kC2fFb7gToQXZZBgeJlrqbBBPARrGPCmNnj3wU1X1DVcwtpNv1aMR1Lc5GqSKt5
	Psf9+QJfgpyGqqGaTPYAvecO9uUd8mJbvz+tZ/hY3Tu0QZe1PhgTbLxkEJkswsDq
	F18qSR8hE36bHH/jS6hXWxwZoFwMW868sdCuyG24F4ez6AmJodyeMQkAWn19Ev9x
	metZKnFMtCza6fDJC+oGxBsX+PLGOBZlLQw8sxSY9DjOaYZbG+wkD4m4fHG5P7MX
	IR1QS7zmkjl4iM3TxGY0dNpp2yHHp5O2Hn750W3FQabRdekdo4I7TqZ8HWgdWKHh
	biNSaA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4453tartkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:06:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21631cbf87dso86704635ad.3
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 11:06:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736795205; x=1737400005;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hjtjoV6Lsl1jRuoL+2xlFjDLFwJ3AA5fShbdt/8gqqM=;
        b=A+Jo/ZKOBbYKoy9DyBPChfIvS7S5UQPR/kODw0GpEhTKR2B1SKqX2dpoQYbP132Dft
         O17PZ9m5GeIx2yywTTJOp+t1dplHGF1tshY5TWg7SToqooTKdbH7QJAkxVYe8Md7P3fo
         7elctY4cQiuANH3t2eWMqLRLfASh+ok3Mftn4zJSHsFILFNIfeoZINtt7p33a17e58yl
         sKixnhvixkdbll/cf5v1O5tN9X87CtriPNKylmmBEdZZY2zWHEcn2GQcN2c0rlEYvw3r
         hWebDIGyjy12bcjwQzDKVVUt6vDsMBYTsM61vawIbZX/IRhCyiIUZHYMokPqsgY/eDhR
         bWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzenYmD7IqNNq7A2a269F3GdiLQxo+aVaZZPbe3L0LlLCwGQaE+qdRDiVooHJjIRFfpcjDmbE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsqonAJnfdLjrm5euacQLfc/xJei/cdu56bWmr17dSk35FfCxb
	THzNN5Hk4znNuVOJfx7W/7S26i8JB2M1bg1KtqGmGKK3Q0W0MyQgyb8QFJ5W4iaLRWK57fP3kK4
	H8CBFygZ5lztjUTSmkVoDR5elAwRI2QztUtFT8n9Z+Gk2/qyBLq58/Av+IFLx
X-Gm-Gg: ASbGncu3fjKXV5z9KK3yXgP264oVvrMBIBxwYDX7ugKQlItKG+5k5Xjjcc/UNQsTZDQ
	LDy0OwAjXX+rK8E0y9hpmYJCMuTp6YuBynoOM8esQMRLwPOukxauSmli6R86E/TYkwpqck0irdh
	lyXJeXE8Sj9Vxv6mM2nA8jir2ItM4Mm3jpsbFh6PD7otM4803VP7pg5HioosHjJx8SiQlpr2TKS
	AKWmPFrdHwQ3gqu6k1na+nGqFBeleYDiZFIudH9exvEA9r/vyiCbuTgdyTNNJ3LZkGeBdU5/BQb
	Fvo1TfwusGAhkVw7SubSbSSvYOH83Cr5nB+JHkrue3otCP49tw==
X-Received: by 2002:a17:902:ea09:b0:216:527b:5413 with SMTP id d9443c01a7336-21a83f67c04mr303130135ad.26.1736795204726;
        Mon, 13 Jan 2025 11:06:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRzxt5EbNETUNX8vMwf0g5LncayJf1TtA2U9zJ0Vc2Uat9XiRr5a3ApkJc+NNOzPe4VDCWlg==
X-Received: by 2002:a17:902:ea09:b0:216:527b:5413 with SMTP id d9443c01a7336-21a83f67c04mr303129785ad.26.1736795204333;
        Mon, 13 Jan 2025 11:06:44 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f26aab9sm56480925ad.256.2025.01.13.11.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:06:44 -0800 (PST)
Message-ID: <f1afb9f3-8f7f-4da6-989f-6183cd692bc9@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 11:06:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] wifi: ath12k: add reference counting for core
 attachment to hardware group
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
 <20250109-fix_reboot_issues_with_hw_grouping-v1-2-fb39ec03451e@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109-fix_reboot_issues_with_hw_grouping-v1-2-fb39ec03451e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eOXNpr-0FKkmVwUTNoekjzAKiosaIkAR
X-Proofpoint-GUID: eOXNpr-0FKkmVwUTNoekjzAKiosaIkAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_110646_301232_DCFABEA0 
X-CRM114-Status: GOOD (  12.91  )
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

On 1/8/2025 8:25 PM, Aditya Kumar Singh wrote:
> Currently, driver does not manage reference counting for attaching and
> detaching cores to/from hardware groups. This can lead to issues when
> multiple cores are involved. Or with same core, attach/detach is called
> multiple times back to back.
> 
> Fix this issue by using reference counting.
> 
> With that, it is now ensured that the core is properly attached or detached
> from the hardware group and even back to back calls will not alter the
> count.
> 
> Additionally, add some debug logs during the attachment and detachment
> events for better debugging and tracking.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>



