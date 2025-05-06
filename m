Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899EAC3ABAC
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 06:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VssZjjWMJWPdqdH0IZ5tzinbZ36xyqX8Vl4pC5FcHbw=; b=GXqItoHG13aBXzZkP8BXUBsZRu
	5ZDH2H4l6ETqXm+vvJF2os/dm++vmNs7mSx7bAkK9PE5vJ/Vo8uA1rso/uaSoAntzaI9z3/vPZ25w
	byRMlppd76kvq68yJkt98hIbNP22E0Db5BqaPyXKmuR13w9FyzwhgOZf1l9zrmQCTn9RYLjrYBelQ
	x8y5VneEXfHxRYg0jENlQMEF6wqY4DEjbYMwvWRowKgMwv+By6C8hlnvc/d3T4DM4t4utSZV+Y8kV
	uacrRkkqI4eAM1t/+IJ1kcSdh4BjLHc4JqjTwbWL+LO9a9FTmH/3nl0NLUVnHZn5qNYOUUcUH+xKn
	0wJzmxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBP4-0000000AZpA-1BXK;
	Tue, 06 May 2025 06:03:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9Q9-0000000A6Fz-3z4f
	for ath12k@lists.infradead.org;
	Tue, 06 May 2025 03:56:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545M3edn025518
	for <ath12k@lists.infradead.org>; Tue, 6 May 2025 03:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VssZjjWMJWPdqdH0IZ5tzinbZ36xyqX8Vl4pC5FcHbw=; b=Jk6s5/zGwEMAY4Wd
	QQk95+qYd61DbVhhjMhLFFLQkkWFtQC366KwcuIumU2MRBzuUYx7Kc8dZlptXhLo
	6siRUAWY3DGbR9whfyyu3qdgeKCHQyhLxU9qL0Rq8B6R1wv0jAlPLqOzjFAJ+Hns
	JNkPOnwGCjqyjNS9qEL4ImJDJ0IGKSUidDCCUxdUpSdbV8NBVnTNxSV8NXOULeKe
	G+JLPqZKkOOqfQivyncUWjN7cEQKKftsD2UVf00IL3OSkqfbEgXILu6frjl9jJYH
	i37D3bbOWmXG2XzdbdGTLrYanZ1cuewNDbdGjfrPeeI3UHfMw0Kwxyqu69vcoyep
	7qy2Hg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv0sg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 06 May 2025 03:56:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso2766777a12.0
        for <ath12k@lists.infradead.org>; Mon, 05 May 2025 20:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746503800; x=1747108600;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VssZjjWMJWPdqdH0IZ5tzinbZ36xyqX8Vl4pC5FcHbw=;
        b=ZRgyqd/fsq1IdCaZi7wuAuFf9wCd+VdCnB6jB847htk8d36OfHgW8hMommqhQrzTyY
         77/jydaMYH3SzjjVrHIrGX5KFGGNx5X9D9L0lH/M3MUjLxSgfqQcVCkTlnI5aVMJ76Ny
         AOlw+24FxJm/XtiHRQ7x91FiGsZJxPzLikZV7v+YG4gd/Eo2/0GJXjYhBpKVTq+lcz5Z
         F+Ypm+ns8u9qf3jSYSUSOspiwp59qPPsxu68AkQEe1TSlucIIEs3us0eGi/lbHW1ik3w
         bZBgFLWPsidEpO0rQLsSnKCqRkUd3kawaSZokAojvVP04Hb0HZkUaKv5RyeuygQwRqgA
         wo8A==
X-Gm-Message-State: AOJu0YzOyMi1Wy62UFPLJO0Wd15vVKujJCsyjIweKgl3mvquq+fKlWJm
	P4JUWUAlCffZOzmhaWxMqFDcI+Vv+2ii1LjVnv/ZlMIuOWEI+0ZYBB9vzGqWiyIMQuDrpnzmyg3
	zqaqR1rMuHlkJ4+lSQJ6uo2mj3dm0ZVlu+GjDYWl104ecUonx7UyVm0L08FqO
X-Gm-Gg: ASbGncsalCP2P1UIRR6PUqWOlvPBXFM1abBVlkAYUkn9VdBkGAf43uZIThhb12MGrtb
	VEDJkUJ2k5IJFqsAnsmX1SvipgBp2FutdclcSjxvHl2kj/zo36MpYOGpSg+PK8TAbiNzmMYqrRz
	9W9J6BaSW1CF04JpJAUxg30aPSNQ0f+UB7CdLOFXD5SJ6unBJiQEX+jfhGag9uXj6//53l36R7s
	cv0uQK1D5lKbeiCC83lDDZoFDLAN0zGb5rgrdLZvQIgeEujN61rjhjV/23qn+36PnqBTRkFL5dZ
	TNt3zfprOsjUXC4CMjgwV+kSen41o+MdkJFY7WEcoMBV6dUyrO3YUw==
X-Received: by 2002:a05:6a21:9203:b0:203:bac4:c6d4 with SMTP id adf61e73a8af0-211823a4329mr2315344637.29.1746503799834;
        Mon, 05 May 2025 20:56:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbSVcvrD6TYRv9+C6F5mpiHYvymOofSleVgeTUg/fKF5J3cksoI1+ZjlKYg+zGXKNK8MhJTQ==
X-Received: by 2002:a05:6a21:9203:b0:203:bac4:c6d4 with SMTP id adf61e73a8af0-211823a4329mr2315313637.29.1746503799526;
        Mon, 05 May 2025 20:56:39 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920f6dsm6456022a12.10.2025.05.05.20.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 20:56:39 -0700 (PDT)
Message-ID: <c9187ce5-2ae3-fee6-8b94-19792a981130@oss.qualcomm.com>
Date: Tue, 6 May 2025 09:26:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RESEND ath-next 2/2] wifi: ath12k: support usercase-specific
 firmware overrides
Content-Language: en-US
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, jjohnson@kernel.org,
        johannes@sipsolutions.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250424005703.2479907-1-quic_miaoqing@quicinc.com>
 <20250424005703.2479907-3-quic_miaoqing@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250424005703.2479907-3-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c-i1b4b9lfMCGq8EYVOA5NvaD6IT7E7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDAzMyBTYWx0ZWRfX/LeLvtPVzjJ9
 ZWsDQ1hJhfdiPgvSrqr5IdQmJ0hHiNXRA17bIicaxh0HxlTayqSPJHHi+wnm4/Qw9XPmbiUgzN3
 XooS700wdb6VgkA0mis3AKIxpiGJXulZich3hm+Mysoy0kyFWe5+TG0zD9d9gbI4gaHxZLYWFeo
 keZxA+D8MNS9rdor0+pUjIfffexwJocYsl3gn/+GVqOMVFp1XYxcEw3rB7Se9AykIR2dYbn+t2+
 QuLDxci2UnPO7q4xH6U7XU4uFt0JmkZ38zbI9ra4aAlQQ99yvtSNNE9t4ZwOXfiCoBef2i3WWmG
 7LOAI73DmpO/nVje1zjAcZ4Jp2T9EGIaQCtvM1TNopnhxHSQvkri1m3QJYWe382nSjEPXLeAzsf
 Cl+9Ie/Fh0eJ2Or36Kq+QvXAtjHxi/p+01KblxI4w4wzBzFXOZb+9rBaPQygSg87udNb9ivk
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=68198878 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nnbtXsLSmtPlU79_SnMA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: c-i1b4b9lfMCGq8EYVOA5NvaD6IT7E7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_02,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=771 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_205642_032667_EFC2EB4A 
X-CRM114-Status: GOOD (  12.13  )
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



On 4/24/2025 6:27 AM, Miaoqing Pan wrote:
> Introduce 'firmware-name' property to allow end-users and/or integrators to
> decide which usecase-specific firmware to run on the WCN7850 platform. This
> is necessary due to resource limitations such as memory capacity and CPU
> capability, or performance and power optimization for different application
> scenarios.
> 
> Currently, there are two firmwares, both files can be executed
> interchangeably.
> For example:
> 
> - ath12k/WCN7850/hw2.0/amss.bin,
>    ath12k/WCN7850/hw2.0/m3.bin
>    ath12k/WCN7850/hw2.0/board-2.bin
> 
> - ath12k/WCN7850/hw2.0/ncm825/amss.bin,
>    ath12k/WCN7850/hw2.0/ncm825/m3.bin
>    ath12k/WCN7850/hw2.0/board-2.bin
> 
> The former is the default firmware, suitable for most WiFi 7 STA functions.
> The latter adds support for commercial-quality SAP and optimizes power
> consumption for IoT applications. And both use the same BDF/regdb data
> within the main board-2.bin.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

