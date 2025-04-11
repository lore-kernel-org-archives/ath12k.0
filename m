Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1386C369A9
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 06:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZjDG+Namf5hIaFTcyTdEBtA14YlBLkmgXS8yfksRX8=; b=ThKqks9BOrFrqIq0a9VKGt2i8F
	yhgWLBGRFRBq7JejYRlXNkqYClSdxtuTOnoptcN0Fvix5wsgELhJn7L6Yu0faaf23PK5XMRsw7ftR
	kSen4dUZ/TQW4I3u+y/0ORdOcMP6JYFJE0w1TosiK6kMcaBCPsPLqcaIbkfhy4+kXIpPMTUUC1Qq0
	QWxYMVSIW4bEW4+Nn3oy9MnhCnYcHLvhToXw2fI5a3S1VSuD8OmghRbqvMfy4PWb7tUhAZqeTlhGT
	G9lNVNEarmpQsmUzakYyPg49p1UWYB7AnqcaoIYImxkmy4xKj72stJKf1SBlS6JjuqX4JMIrx0oxw
	CY4foEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u388M-0000000Clmw-1faK
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 06:45:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37pe-0000000CiTt-44OF
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 06:25:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B63bDD032542
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aZjDG+Namf5hIaFTcyTdEBtA14YlBLkmgXS8yfksRX8=; b=aKWYuWyX2yxT/OBN
	P/Ibec3k9itz6I3HPdwEBMnDAgTvjsWX1uOLnhhUHvCsB+aCmYWXD5pXpZxPzjBl
	SFFEXDc78BReK3y2dinhws2COm1b9RwNqwSEEZP0m/L81eGKLRaHUF2KUjrNwrjH
	+WrG5MSJr4zrEOYCfOR2hTnQq2UtbHLDlI4mbgVGFDwThGzdDg3e6XSZi4Wvbc5n
	tOHBYYdAJOKindMJF0/xBktG2u7PoIkfHF6glFISVYlURkhDnHJrC5I2GqwNk7ti
	HU9JqQ2iKuvyJRcrnGsd1LKFz1WQmkanpQLLBptncyKL431TjndneUq3hVtx6FVn
	+prdgQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfks738-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:25:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736fff82264so1339265b3a.1
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 23:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744352740; x=1744957540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZjDG+Namf5hIaFTcyTdEBtA14YlBLkmgXS8yfksRX8=;
        b=EWKVEb662Nc53KGin2yoKVFkJscX7UJdYGB1UtPQ3vudRS7/O41XwUyqPyz/HFI7Ha
         M4itZhKPDoAv67a3l3YvM1WDBEmZF9BYSJdvuhSe9KMsAcCb8mUHRriaM1GCb83VUYnI
         f1y9zCaMakoc8sJRI3JiLUOXcEiSHwP7jr0DNIjqCK6XqM0BWbexk/ZAX0LXEYK/OWRq
         E0rY1eEl9n+PBRmF6hp4qFINH7Nc2UN06oFtQCK60RPGOu7aq3GE4Nb5q30uAvWXDIbn
         DcmuIep6Y5n5DFEl08/CYlp1IabuX9+vYiC2Ql0zCErN0nualWHgVv1ad9DdsQZ2sigh
         Fpwg==
X-Forwarded-Encrypted: i=1; AJvYcCXYfe7EeAg/jBkBfcDruZWc8WeT+lP9K6wNe7nyflAqcn6cjZS4paT7qBtNpkL4AlViGyRhuN8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVz8I2McU2LC+wWKKBf+sUSaJuMb3zuI65Spj18Wa94So1H1/M
	Bru75TVthhECrHiSnWnBT+P+dr+0kI1Vq4PslcelX9A334mwx9oqRBTyke9Cpv4PjgsNiXrJLON
	HFn9RpHcKe6kpZzwv0tAdOcmSSZ1DaNt311x6INo968rPaShQrY6cMHQj0gY3
X-Gm-Gg: ASbGncvj48MH1XCcVxwnVjGrZSkLDzm64Xe3bNrMdZRMrbRdGav8uFfOYtwq7DVKCW6
	K6L2pxtZZgEjfZH5ILNAnM4rfUOAogq2wDM9PnQo1kr3OrtIsL25z7YBVvDa+1JWtKn+xzy5h5d
	54ODd3kyV5QziX1Epcv+pz3kgtwUpv9liandpPk3+P7yLw57S352SxQCegOpCA81Me2U43UKAPO
	+R2/g2RyEMcMXFGbmh1JO0bFGh+qJce1cr8qqJCnqYbIa61KUi/xMg4mVrAvOCw/5sbWb2G5JVg
	+9UYyBrxUcuA0CvNPA5/niB5nhIbjPIBjBF6MN93xrBYJxAXA4X9ew==
X-Received: by 2002:a05:6a00:1394:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-73bd0bd4548mr2518651b3a.2.1744352740350;
        Thu, 10 Apr 2025 23:25:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMA6R59sQ1NqK7igd9/2jNcxA1+RfqvbTNMKUH7nNQfU2hU/UALeZME6rkL6dw0k1o8VMEBQ==
X-Received: by 2002:a05:6a00:1394:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-73bd0bd4548mr2518625b3a.2.1744352739898;
        Thu, 10 Apr 2025 23:25:39 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230fff3sm664098b3a.125.2025.04.10.23.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:25:39 -0700 (PDT)
Message-ID: <24179c31-f351-2ed9-2699-d98615742d4b@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:55:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath12k: correctly handle mcast
 packets for clients
Content-Language: en-US
To: Sarika Sharma <quic_sarishar@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250411061523.859387-1-quic_sarishar@quicinc.com>
 <20250411061523.859387-3-quic_sarishar@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250411061523.859387-3-quic_sarishar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DKnDwMchCyLlMZaOUZqzL2l0PRj3hY67
X-Proofpoint-ORIG-GUID: DKnDwMchCyLlMZaOUZqzL2l0PRj3hY67
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f8b5e5 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=aG53odMEPdmtmHfcJ14A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=717 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_232543_135481_01E4BEDA 
X-CRM114-Status: UNSURE (   7.94  )
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



On 4/11/2025 11:45 AM, Sarika Sharma wrote:
> Currently, RX is_mcbc bit is set for packest send from client as
> destination address (DA) is multicast/broadcast address, but packets
> are actually unicast as receiver address (RA) is not multicast address.
> Hence, packets are not handled properly due to this is_mcbc bit.
> 
> Therefore, reset the is_mcbc bit if interface type is AP.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>

Should there be a fixes tag?

