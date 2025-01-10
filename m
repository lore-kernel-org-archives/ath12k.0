Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE1BE77188
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbBr/2YV+43XYtiAHsrETIQDU+mB0rvIRAZTp0sqqQ8=; b=GBMcU4O3gG4EdALEZA4jna2qed
	0w7Uq4pDnTlOIEQEKmwWHf+CjGhAyfPWl38xmMsUKR6tTeetxtiU0bI22zbSACbkwrUvxMRUNtqkF
	fQoQRKXgE6J2BSVhnTc6nuvEqSM9KbQUB5ZMDM2k6k2iPXbz3ILQ1L2sNL1MBXuGD51g75RKJ6M08
	kdRSrk66ADgCrqb6exel40H3FrF2pGI2V7jTrD/c6NwHztjt7390ehajkRtLcwSTvbFvE60gTlJmE
	1stNM6QZc0M0eiLo7IjyHYHTd+if/zeDvaFcZm8ixyZrD1QPFGunMiYGeAOuQy30r1NEowTSvoRzZ
	qQy95r9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHnf-0000000GE8l-340l
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 16:23:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHcp-0000000GAf7-3BPY
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 16:12:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A8ehRE004398
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 16:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zbBr/2YV+43XYtiAHsrETIQDU+mB0rvIRAZTp0sqqQ8=; b=dAPEUd7QQwdBcWzs
	exgj5dU5Nxz0Q3Koaq2VLwmBMlE+ypyEtH9Hf401/rJJbNmE+ecMYiJ/ShO9r/aQ
	/Jn7osgUd5bTCElNV35vXHoAyPhh++VPkwaeS0qk4c9icW3U8XoYufEEBaRzwAHh
	th4dQJlA9KbTEhZFvxBeIWo9eYXBJFR83beGmihi8V7Qrlzb0fpAOARrCpnD/TXe
	Z+IuFji9W2HP0SobT26yDQfUlHLR3M20ca8uduoSoGe4NnajN8sXmh4beQBU3DCs
	2HekKven68lLlOunojY8pWTLM3o2bo4CL3XmyquhryYyKHbkAEUwdfhha7Vbhvhr
	p+i2Wg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44308f97hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 16:12:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216266cc0acso55400945ad.0
        for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 08:12:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736525561; x=1737130361;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zbBr/2YV+43XYtiAHsrETIQDU+mB0rvIRAZTp0sqqQ8=;
        b=ZJZBavWnpCD4B5N7jx1M4Dreq1PZ+xBQRPRpAk6r4LsszN5J/IxkTIuc2k8/e2WRxi
         J3xe/mZ8sYKIUTSe/ysvHPbKsi8a6E19fEmw82s9tOrClGpkAZeEcXZqdiFcynBbJgc5
         V7t8ZfBt12p0GnP8VJ+QwHvMSLSVx58j5aVMi+gxIZwfJ19a7HPzaA8OGVbMqzu6Ue+9
         CSHnWyLd/qd4ky5zGCDtI4lB1dZEVEYAvb7+2G/LJTWx6lZf71IkJgPxA9Wsz9WfkcpP
         1kOFxTJHUWJ4yd4qflky3Z0cj6+l3qNn5eYX8Zh70YY3BcFH5+879WQa99IeBzt90+ZG
         mubQ==
X-Forwarded-Encrypted: i=1; AJvYcCWukTOGUcqTtQt/sfcGEw6fqJXNgYdSoLMURYJ4BgKwlvCBjK4yv6Ess+79Z9S5xMn64thlngs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yytcq9may1Tb2pUYXXcGrZiIlNnyREbcRB9EOIbiUtrWOoGTSnP
	eyBiC0efCxYGJSzwQBHAhz+9IxmLULEmx0+fX2ihgWkSWuoG7C/ZWFoEVabX7T8r2FcJO0yyx+I
	Qt37pGK8gTmZo6ndzGmazh/1KE7hw8UgZscAcgsrh7A8aeXM/SMP9D7/woEM+
X-Gm-Gg: ASbGncuV6lcJJzvSgwDXy0unEymwmJMQQv/ZFF0Baca8QOv99PuIH64fi90r5Gm2n4w
	dUS70PIPyXnHneTb8gyX4ZBfzjtyXcoIhzqEqixoUsL/Z0r3ywoyRLmy1l4oWwIEPHlG6C8pfh6
	gUgQcFyUFMV6PmneF6XGckLhV3DhFmk409/pGX5ZT0nr5PMMmEjzHGVgXonsyBrPR9qBcgk6yT7
	13I98wevwb0js2Vn53c7cs86KuzVjQz8CF5gQiuIx+bWfp/XX8YtLN2CAQpiy0yoKnZXWbeZfkp
	Qf82EO34EhyDe64YwLAp5p+CW2C5N4MNSrINl3IKPFNB2U0X6Q==
X-Received: by 2002:a05:6a20:a108:b0:1e1:f88a:3106 with SMTP id adf61e73a8af0-1e89c91f577mr11297473637.7.1736525559928;
        Fri, 10 Jan 2025 08:12:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENi+S940ap8/hhfB7Iq2nbBER+MXuNzad2FWMXp9TGJipSuQYikl3bjuJUKtZkTElDI1lqCg==
X-Received: by 2002:a05:6a20:a108:b0:1e1:f88a:3106 with SMTP id adf61e73a8af0-1e89c91f577mr11297346637.7.1736525558105;
        Fri, 10 Jan 2025 08:12:38 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31de807786sm3034286a12.76.2025.01.10.08.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 08:12:37 -0800 (PST)
Message-ID: <7ce4b4d6-acb2-4972-bd65-7f682cbc564e@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 08:12:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] wifi: ath12k: Refactor ath12k_hw set helper
 function argument
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20241217035920.2683568-1-quic_periyasa@quicinc.com>
 <20241217035920.2683568-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241217035920.2683568-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -Rh1jOcCcnGqlFcxJjg2k4zTTNrCGdi7
X-Proofpoint-GUID: -Rh1jOcCcnGqlFcxJjg2k4zTTNrCGdi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_081243_957303_E66BCF97 
X-CRM114-Status: GOOD (  10.00  )
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

On 12/16/2024 7:59 PM, Karthikeyan Periyasamy wrote:
> Currently, ath12k_hw is placed inside the ath12k_hw_group. However, the
> ath12k_hw set helper function takes the device handle and the index as
> parameters. Here, the index parameter is specific to the group handle.
> Therefore, change this helper function argument from the device handle to
> the group handle.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


