Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091C1C28B20
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 15:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RLDiMmXysIlGMlCO7Egquj+Dqvq5IbDsVXrOdvbut8=; b=bpE8wtY3sbkWOUYI57P0PsmKND
	J6eqXuivyOwG1y8oYU4jPl3w5tX/WZzZSwR0MjT7f5endhAecE2D2RHjEIhWPikdg3j4HxPHFgfn8
	a2PN4HARj5NRUVM7UIRDJyZGo8W7vI8fu4ZU0MyKikOkqOYdj/Bo7KB2uZD7r+Fmbvc7pN1i2NuxX
	JR3wD+Er9+gKqgfGBFrZnhqnyEFF0m5FPnbhz/pCkb9QHEaWE313kRxjbvP11F0Iu25g2Rn1Oz9WT
	8KTw0PJrblmAb3P32rkeomeLRcJmSeDGeKg3XJ6AEuYte31lDo5cj2cAyEC1Y/Ck895MrhAGdSBlM
	wu+H4DiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00Bs-00000006Xlx-3Lry
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 15:39:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00A4-00000006XWK-3wMh
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 15:37:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532A5a4n027416
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 15:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9RLDiMmXysIlGMlCO7Egquj+Dqvq5IbDsVXrOdvbut8=; b=eAqWKt1ROOYubYXG
	N8zhxo5D1bK3H27yJB13kag36rCWw6iYDEVBpBu1O2eHUwNOXvwijAvYfNsvEnQR
	wq2Vn/EIFAUWCsE4Rvk0W1UheWHOm+dVQ+fbocQNyGbT4ehje9mHPoRBEL+e5Jlk
	UuI2r+PQzkGJjiBhaHSKSa43OXTPUn/n+UISr6/47ryqh0+v8hIiML6F9JnKoXyA
	1obfG+AkZj3/BLNnE6EqBdae2M6gg+MHCDQfkYnutsvM05VBZo2Oh73B1Bc9zrbF
	HBLssIw5dujKnvWLWsWIZXFNCBIfNOt14jD8Cyk09KJ5OIlddRsqF00wJG9K2xJW
	rC8K8Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a0vtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 15:37:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af510d0916dso2242a12.0
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 08:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608270; x=1744213070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RLDiMmXysIlGMlCO7Egquj+Dqvq5IbDsVXrOdvbut8=;
        b=fT/xga+knHJRQRGjVBWDZ5H0RJtPhtLTJxWhlQon6q9mdd6Lo/MptcAM4n0FpoqQ/q
         LsiIxq/VFzS7VQUVvoMc6E1PfBOOOYoEBxYlQcSaAjrMby3NzJf/UnEhW6neLONg04sg
         U3wlC/BrJfeOzuBclr5il/8GKtOD57oKIsHDtFhXZjbHSu+9+7jO6KWzeYMOvxhhw9BC
         TaAaxj1/dG/wMjuL6brM6V7GYklumytJbFr0tV687b/oi73Xq5wvbOSoYpiiphlcDSMe
         tpXfWWBV8UXBXpXIsJLMbWovGkC+LilMgZcmo8UyjMOZ8RrSG9JpUnII83GrK5ZVl73x
         dxeA==
X-Forwarded-Encrypted: i=1; AJvYcCWUKHgllwKF2QSUZjsM7iW+OGBKuL7QMYYeansnsgFlHtJQlsc0gePeATJDyNI2QxjpsUoz8P0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDp/g6ps5sThYdE+YktSTTi4E46uV6kjZAdFqnJiwbb85eAaec
	/JNAa5mU3Dv3EHqm8DHLrnvcM2oQLF4eSrRU+D1MgL9Xv7Xgu+yhg/8TsD+lbY25iqwVM4PWRg/
	ulnYUqukiqs1eBBs9CjfU6LqUUULNxbaEKJ6bClthDIidJXVUxSZzKtJVYC/S
X-Gm-Gg: ASbGncu2aC7RspVh+z1eMlFZmwV7Fikr7QOuMWiMpBIH+nOjk2ZyGMtdUhs0/L9gsr2
	yl6REgz+HoVeNQ306sAm3g8JdLJOuVGmvpXTZWmaHmRaObNmLKx3B97xkiYCQTazG2MFMfO8TWk
	ETVaXsr1PG4ARy+7yMAvy2JSG9E42U0nWb/iTclYsxxrLV52bvhJ4q4hksG10V/dul2VUj5nJXl
	Xr/DIuWhDfeTqNxzKLToAzeNzJ0w57kQwsbOlu0VJoUaNh1ZCuUgYCy4afTLT9lfvNnyCYK3PUO
	02vK8S+yg9gz2nIXE6lIApzWPUrRzCO+xuBZWz/4/BuMtOrkvZ5wkVQhsp0walU=
X-Received: by 2002:a17:903:46c7:b0:224:162:a3e0 with SMTP id d9443c01a7336-2292fa050c7mr294289495ad.49.1743608270398;
        Wed, 02 Apr 2025 08:37:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0OH2FJnITjMPKmfuTm0DY9atT/FD4nOqsDUoPSjHD2dC/SJdy81wArZuzwTl8gRgbPJvzuQ==
X-Received: by 2002:a17:903:46c7:b0:224:162:a3e0 with SMTP id d9443c01a7336-2292fa050c7mr294289185ad.49.1743608270044;
        Wed, 02 Apr 2025 08:37:50 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.201.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f84fcsm110188425ad.228.2025.04.02.08.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:37:49 -0700 (PDT)
Message-ID: <42c4d4ca-de5e-c7b4-e77d-489509dddc02@oss.qualcomm.com>
Date: Wed, 2 Apr 2025 21:07:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v4 2/3] wifi: ath12k: Add support to clear qdesc
 array in REO cache
Content-Language: en-US
To: Nithyanantham Paramasivam <quic_nithp@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Balamurugan S <quic_bselvara@quicinc.com>
References: <20250402152529.1649402-1-quic_nithp@quicinc.com>
 <20250402152529.1649402-3-quic_nithp@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250402152529.1649402-3-quic_nithp@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67ed59cf cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=HMRESTvIlCqp6qiEfvMpsg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=82-Y7rt2ZJAcIzJ_90QA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XC3GdCCzZfesh6rWEoMlt5mS8d9OtmHz
X-Proofpoint-GUID: XC3GdCCzZfesh6rWEoMlt5mS8d9OtmHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=727 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_083753_118076_91B8D094 
X-CRM114-Status: GOOD (  10.72  )
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



On 4/2/2025 8:55 PM, Nithyanantham Paramasivam wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> Currently, the existing code lacks functionality to clear the qdesc
> array in the REO cache. As a result, any updates in the LUT are not
> reflected in the REO cache. To address this issue, add functionality
> to clear the qdesc array in the REO cache during a peer TID update.
> To do this, set the CLEAR_DESC_ARRAY field of
> WCSS_UMAC_REO_R0_QDESC_ADDR_READ and then reset it.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

