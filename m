Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570CBC0218F
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 22:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzrLG4JS/fWwtEHwbff15586VvIk96Av9ZQboWCAQg0=; b=vRc7fmzvv9XRIm5LTcahrfPJQ4
	3TOEaEn3mY6S+a/tTYzarDw9lNrqw0zLJU2uaCNMjJfukqDylUsCTQLQg9JI5ee7+SQqCuC7li31P
	KdHuHUv4AfMPrgYgrSgsfrzfwbLQ7m+vNCgnixGcR3wNekq9k1gy3Yyl88AVvMDOJgfV712YUNXVh
	PNuW5oVXlziJ8BKeLVSdUtnIuwK9Fx94efZ0oeBX+jvGjcAifMmE3mtFPzbyAk4trkynOIPgmRwEM
	14sfu3XgwQ7rQCaWmQmHa/klFejoj+fprBtUcQ1IfMW7GmsLeNx4Iehp+jhzbwJAeHrnePwwrqsP7
	rIoVwIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdzD9-0000000BXNq-3G0z
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 22:10:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdzD7-0000000BXNH-1Oe5
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 22:10:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VAbS2m018129
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 22:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzrLG4JS/fWwtEHwbff15586VvIk96Av9ZQboWCAQg0=; b=Go/qP/sJrqawnM/k
	N7kNhnRIiZrhnzEGxHZOZAAROvnvhZv2/2pvJwoWKyPZtLZV+gexOt834zwxIGYO
	VfKrbgRLEz0tGq+3WznOfwTjv38wIparg1SRFcPIZMqT4BNlcJdRktRUPdSoaSXu
	kRBoiB9M3l7mmc+1V8aK7banke7Gy4okmD/9o303UbXoeo4cLZcv0oBJuboc4/AT
	+I2wj1QAzdBaBBQ+z+gdL3K/9o0798jL602cskG88rIplogZtwzgv4JkgfwkK6o+
	/6zuBGg9cJIULBUaH0a+xW1i5aEsQflIiLDXz4/yey1Msy0l5A80OvUNMhW98+LL
	85YCSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gvx9hhwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 22:09:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216266cc0acso60777295ad.0
        for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 14:09:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738361398; x=1738966198;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzrLG4JS/fWwtEHwbff15586VvIk96Av9ZQboWCAQg0=;
        b=KNdv4uqAW0NTssim2bT85qX7e2fwdQ3afMULPYijN06FH2ps9+unEUvzLjhY/1+eYc
         C66pElTt8pqUGXlJ4a+NIemhN9RECnD5F4Ia5vsR8YpCjwktIcdsoieVM7qJpm/E/xD9
         l48Z7fTHarAxjEOQgn6j97hOqY9oeZJJXcE0lOI3yawCWn4G6eEXwm8UAv9EYGkroY7k
         8KQ4UzDvX+OAiQC3+5vGkROiErRbxBqLHaRK8nDgeYPT7CYykhwWbHY2NSTVYkLR3Tr+
         HP27yb6sMH2iLwGdnrH18tfHHAzNg5ovQ7U+e/IPdvOWLwLMhuCnmuZfFgMNk31vXrzh
         mdkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe1x5ilznxLunlQD7UZglNW8opwfznCpOQl3yxmEp4EaaJgjkeQXY9/Jrusrepkf+gsrq6NQU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSaPAj/WmbcTtpiN+R/DVfzgr9/VLhHpW1ezCLqC5eBppgvraU
	ZWiDypGdAK/XlHKstYVu3jN+b4Lt/udnzIgWuFxfJsN8j9VzSWH+s/qnaMPOoin5gPSX88qpcxQ
	3uecfToubMIcZ6zm4Ri4J0a5UV5Tx8m00geceR7GVV/Nllst5HqwqMA1B14+k
X-Gm-Gg: ASbGnctPGFXe09zldbCdrMJdJ8s2cPGMrgwu7xDdmHr+7C3K1WlzyKmvb4aEhLUUM0b
	zqdYvLoAPHRIz/mMoC+odCPlPi/220LUs85mMXqaLKrXIRKwUDG5cvbKoCBwJr+KcDB2pD43XDz
	rzFyG9ncZANkl6zQvWF60mR+vYQvcMJagjVqoNnFvgQ7xbpDtPa26G5hIRSo9ybOffponTF7OW1
	lX5yr1WpXifFWxEcx0ihRzaeoIWvr3oIqTPmOhMdjXT2/m8QvUPDIXTYkJvj++uZvf2QKzKcmia
	hWhLOF7KN746edYR9L2QJrftpBGIwIs3kwWa4rxsdtGUQnCvZGppIQjzTUPWfUZBRoscJCPzlg=
	=
X-Received: by 2002:a05:6a00:3a0f:b0:724:db17:f975 with SMTP id d2e1a72fcca58-72fe2d5eebamr12841880b3a.12.1738361398514;
        Fri, 31 Jan 2025 14:09:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA58tVXyHxvzv49/ZX/BxOfEGx1wGjFS+5r8qwLEN8Na08t/yBZwAowGpK6CHqZAm3x4i9sg==
X-Received: by 2002:a05:6a00:3a0f:b0:724:db17:f975 with SMTP id d2e1a72fcca58-72fe2d5eebamr12841842b3a.12.1738361398028;
        Fri, 31 Jan 2025 14:09:58 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cf267sm3907978b3a.147.2025.01.31.14.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 14:09:57 -0800 (PST)
Message-ID: <6c4d37a2-8f67-4b5e-81dd-eb61f9b46dec@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 14:09:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: support average ack rssi in station dump
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sivashankari Madhavan <quic_sivamadh@quicinc.com>
References: <20240514124949.2197384-1-quic_ssreeela@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20240514124949.2197384-1-quic_ssreeela@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OVLHIkBWW1cFvj3RWdi3qzI65kAP1BLy
X-Proofpoint-ORIG-GUID: OVLHIkBWW1cFvj3RWdi3qzI65kAP1BLy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_08,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_141001_498869_364579A1 
X-CRM114-Status: GOOD (  10.77  )
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

On 5/14/2024 5:49 AM, Sowmiya Sree Elavalagan wrote:
> From: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
> 
> Currently, the ACK RSSI value is not shown in station dump. Enable WMI
> resource flag for ACK RSSI in WMI INIT command to add ACK RSSI value in
> management TX completion event from WMI. Update ACK RSSI value obtained
> in management and data frame completion path to ieee80211_tx_info. Also
> advertise NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT flag during hardware
> register to mac80211 layer so that ACK RSSI is added to station dump
> message.
> 
> Example output :
> Station 00:03:7f:12:cc:cc (on wlo1)
>         inactive time:  600 ms
>         rx bytes:       288106
>         rx packets:     1446
>         tx bytes:       41818
>         tx packets:     342
>         tx retries:     64
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      602
>         rx drop misc:   51
>         signal:         0 dBm
>         beacon signal avg:      -44 dBm
>         tx duration:    0 us
>         rx bitrate:     1441.1 MBit/s 80MHz HE-MCS 9 HE-NSS 3 HE-GI 0 HE-DCM 0
>         rx duration:    0 us
>         last ack signal:-51 dBm
>         avg ack signal: -50 dBm
>         authorized:     yes
>         .......
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

For some reason this patch was deferred in Patchwork.

If this patch is still valid, please rebase to current ath/main and repost.
Make sure to add 2025 to Qualcomm Innovation Center copyrights.

/jeff

