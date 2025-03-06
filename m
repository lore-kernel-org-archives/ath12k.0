Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3246C282D1
	for <ath12k@archiver.kernel.org>; Thu,  6 Mar 2025 03:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mp/6YXxA65JIhOvOJKohYGo0S11I79RtwIma3xS3OWo=; b=bhnPxpOx/KcWnvraxQv1X89Wgc
	kEBk6orW88rrksV4cnwnGHenh2Xs2Tt/BBGx2GWnwdPMoqZVtCVERwkXQIGDT612VZh46EDFVpO9e
	AVFnjdX5AQlcB3Smrv4lFZqOv3CawsqjhFqd5YViEvyvP+bak54xcd2gaQMX5vZDvvOfuiT439E/U
	P9TDm1s+PbtQyYGJFExhHtAYesH3/fOlaM9DY1Gp0H9INApxLI4YBX/tu4BUvKBKxQCOaiqm9cJEB
	xRcLiqoxd5KYgIMYm06Fm86KPeNwPVsusgujLO51SfHqj6ruBTpX3MsXxHrDflYCUsV4tGd+oZslF
	1nD/FNDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq2Ga-00000009x6K-1RVK
	for ath12k@archiver.kernel.org;
	Thu, 06 Mar 2025 03:51:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq2GX-00000009x60-32Hx
	for ath12k@lists.infradead.org;
	Thu, 06 Mar 2025 03:51:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525KeHWJ012875
	for <ath12k@lists.infradead.org>; Thu, 6 Mar 2025 03:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mp/6YXxA65JIhOvOJKohYGo0S11I79RtwIma3xS3OWo=; b=BqOlPHxo1eU8RaL7
	AgemsoKD6fdgK98jr7xgjnraAnWZgusgB1wv0VuvpKjEsnehYSFzoSFhMOXhrmm4
	2Ixsm0VlzIrw3Ed41hdDR/DlOpy6tZtCs2HelB9Cfy/iLTvpbUROyvLmx/5hC+iH
	RDQZmfVBJB3UMySDBFtm4PCShfzSLJofRL7A16JuBShqrlZjCMT/xgHYFxm3dF14
	t9Gpv62krCmTJ8/H/D1rR0bnpZ6YblimzHBIj5NS/wfg0BbPtU6omSRb9wKIRAcX
	gf7fdDDyMuQ1/oaZTxuxenKqIjBGLnN9nruDScJeswYE49YTXGwN5BjOI+Tp+BSy
	6GK2VQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vqn0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Mar 2025 03:51:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2feb5cd04a0so522826a91.2
        for <ath12k@lists.infradead.org>; Wed, 05 Mar 2025 19:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741233077; x=1741837877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mp/6YXxA65JIhOvOJKohYGo0S11I79RtwIma3xS3OWo=;
        b=IIE5S4e+xMdB3twya80bgcbf17EgxG2DNgqdbTNmQArqThhjiMkC5mcXizFNa+A5tk
         2qDN4xFq10DfDOEJ+GH5NwAeXnQjSf8XpAc/YE7EshJjPmv50SLHxqdyo2fiOUaq7Jbw
         UMg/W1vVaJyv382QCkm+5Zu0HE+z9C/VxRCP35QDYlfGUqjpHwIKwdzOAaKa5qqF/u1J
         2QOVD6yYrFSMled98i3unTtk5dW+XqmDvSwAsmI+uEqVSHBiFMrYfcmUdPFi3yLMlGyy
         a75vmoOJdwqPuaztPeCe6L4hyMKykMDc37CQZU8KBZbzDr7gp+t1RD2tie3Ud2ukwyUL
         /cuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsJ6lKKI+EwG8jzT+/V7kxNG9hA2pOaGys38/JVaIEG6qYUl2Vka5vVhh5HgGfLjfVdS9qjuc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Vek+JomvsXLCiQ8b3So8UPL4/L7eXQHwEsvd/tHP45TQg/rp
	w3HYB0GQqrxcWWKwXfzznVcy6wIWHBmsi2bzIcpgi2OZ+pwCdDFEFkXt50QjZ7LdOgPuBCYvS6/
	ZIP1uGAh49paCMo8AwXyzAIhK7GFtWVnbfyyBnor5yyZpO5Fxg4N7x9QJCMnIgM89X1W8
X-Gm-Gg: ASbGncsHUUOjzZrcMftVEIYk2xx4OdpfHmJzYRGU3j2MQ1yI711Pg2OqnkhHI+Te/+S
	ajb+TVexDmFBRDtxdHhcxdmZNofy96k9LkCR/Qh2nyjCch7+wX66VZ+UmfwY5Q2ROGSz79SnEQg
	DBnqJJmrc+SJQ2SCDYbrzYN+tWWETbNtHmOipLw5jJpIY1EIQgjnFcA4EWzVgYuFSbOqGTX2MNU
	UiwWrsh9m1djwTdIBWsIRxqnTzv9L2a3GoyIaYFl7TCPLxaDDxDyEX+YbYS9cwjA0sbqSeaInCI
	dDpD9UJ1PlMM6rHawU5rDlC29p0JrbIJ3dxP2fmPwTawiAQa8uvBIsxkNw==
X-Received: by 2002:a05:6a20:2444:b0:1f3:2a83:7548 with SMTP id adf61e73a8af0-1f3495c01aamr11494986637.38.1741233077612;
        Wed, 05 Mar 2025 19:51:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXCFBh9xo033zrGhysb3PJP32S0ZetoTc3J6B1zaxoFsgl/GvE1z20/MNB4ugW5rmtFHNnQw==
X-Received: by 2002:a05:6a20:2444:b0:1f3:2a83:7548 with SMTP id adf61e73a8af0-1f3495c01aamr11494943637.38.1741233077208;
        Wed, 05 Mar 2025 19:51:17 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698244180sm256743b3a.63.2025.03.05.19.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 19:51:16 -0800 (PST)
Message-ID: <d0433fb3-e8f6-2f5b-6c6f-490aedc5aee6@oss.qualcomm.com>
Date: Thu, 6 Mar 2025 09:21:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v9 08/13] wifi: ath12k: add AHB driver support
 for IPQ5332
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20250305185501.2400888-1-quic_rajkbhag@quicinc.com>
 <20250305185501.2400888-9-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250305185501.2400888-9-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gqO6-1_H7CO9VN6o7rnVYylWJbJ1sYxN
X-Authority-Analysis: v=2.4 cv=LYfG6ifi c=1 sm=1 tr=0 ts=67c91bb6 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=cKnEvPqYOVkaVG8RjQYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gqO6-1_H7CO9VN6o7rnVYylWJbJ1sYxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_02,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=784 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_195121_785703_6ABFFEEF 
X-CRM114-Status: UNSURE (   7.98  )
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



On 3/6/2025 12:24 AM, Raj Kumar Bhagat wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> Add Initial Ath12k AHB driver support for IPQ5332. IPQ5332 is AHB
> based IEEE802.11be 2 GHz 2x2 WiFi device.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

