Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE26C369A1
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 07:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeUraEBMOIJ36Sin0Xx9xrG4RCGl3l2XSiFR39cgfk0=; b=sxPKfsa4BU5UerCPohSrMiWTz3
	VGETN6dRlF3elb+g3lDTz3aHh4Gj2xfqA6AqUFBoC0Qxoqd2G+AXWIYYi4KCjvqwZuvW5tv9ntphE
	BsayA2Wki+wrRQ6nmff0kzOcMcwThbCha978/HgWprsYovyJFaUC2lxDhCL0P8fgLYa6iz72XlF0r
	yaXB2OLPi732S+TokOJ5LCir9PmR0vXv5WUJAu9w/UQM6Jer4Nk6fP00BnU+FhwT+gWcQym4ipj+8
	hkIOEm+x0oOViAw6i9uM+jByrB2HrG/9w47aWsqJTKyBU5Cft2X7Hb2imBYJFy3gzjM0WuncPfzXo
	iNmikU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Psa-00000006Qcs-0RfA
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 07:29:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PrS-00000006QXd-0ofd
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 07:28:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYqkd026657
	for <ath12k@lists.infradead.org>; Wed, 9 Apr 2025 07:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SeUraEBMOIJ36Sin0Xx9xrG4RCGl3l2XSiFR39cgfk0=; b=ghlbDTdqpDfTvwSi
	coB5f6Ks9KF7ci+P7AlgN7CRGtQE63tAsU1HFEfw5v2hu57GnCt4B+CDF/Ib6obK
	KZSrB6Mz+7xv5hLbDyDmqhbYMM/VvzCcz7iiw7Lec3M1e1CTuncEdJuIhaIScC5x
	1lhlofGn6hY4cwJ95BvbUuMTegDfIH8rosmNM3+/mQOI96ZFcofunuuh4TYQX9Mv
	KLTsYvPIcuPoNAJlHSAqp74JzzJhSELLCzuCGNltTJYKJ3mRf/Wwi22S1kLEgN2V
	hGn8HpzaxGq4usjXtp+txf5KqJgYfgwUsFlBbMyZXQfqwh5d+FAP8eyXf3sJ2jW9
	5zCdbQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgjgvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 07:28:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736cd27d51fso5768805b3a.2
        for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 00:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744183715; x=1744788515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SeUraEBMOIJ36Sin0Xx9xrG4RCGl3l2XSiFR39cgfk0=;
        b=KxSURJsg/4DI767EXu60X0lTHm6Fc2CHZXRr2Ooc393YXrPzMTe2u7NvUGYvlVzOPz
         VUKgPpirgWzyxXAQfxsgXP2TmOPHwl2Mn81Vycyd55WlTaXzyM3xj0JKlOYQjtBwcC1C
         j3KR1mL+kTov1L0nbexNYfdd1Npn/8sjyx2MbieEZzSuywTrNE23kOoftUkbe97KC7xR
         N/h7xl0wrWI6cLv4J3Q5PRVbPYXmvKP81qURNghz2UFDhOwLTiuzLo0kghFrc7X3E0mc
         A51T7k1fT8mbEQiUCy+Q2s+wPm2JupLEbfsdNFJYYEquLWhw9OZ8I5LEl/n59gTMCxeQ
         d61w==
X-Forwarded-Encrypted: i=1; AJvYcCUNGiNtsF2pZy87lCSmTAL0CWtzTOk64XUDQCSu48Ll6Lr5gdwJDlUeaX3dXSBAixax4kJAxcs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEyDie2kgs5X7aY+kP7e//FcixpOl5aRpQuMBF6MOTAy7r3Coj
	tsNWlXzD6f3ZTpLeX9LfW4kAA5u1F4Wo8g8b3Zh9SK/cmgbTlyyWUvyvMU5on95AT+w1Y0OGDi3
	i7fi+fnxAquWDxQzthlA/q/YqpiESB1hygihhcEFMDBx3D70s1ISIn5w3ykW8V9WVd1Yy
X-Gm-Gg: ASbGncvXviWXvK0dVyg9Num9l4DDd3NjM9voyqvcimJ812/1LHR+pI/wqah9Dk1z1qG
	L0ro+dPJC5A0nsNBEFmVvrjbGDn3GZfoKdyo1RsihKDl+NmJU7v2eQH+TpnTQW+k9rpXUpIOAue
	YhQQNwgqjWvXce8KUUqM9j4sxIv2jIb/FEhcnDP/aZwPFhuDV8efyDWkU82oEjMTmT1PlHzdQNh
	TWJw+I7Mrx7Z26sc4AC7XKJXZ10cZuGLO+rgUUKSF+nY+wRfcDXojWyWpoInmg/dmUfyAN3rI+K
	4ZC+Q3/EHa6ZoehsJNhQqSJlD8UHRseXWzgAmXGS4/fkTUqxC2FfGQ==
X-Received: by 2002:a05:6a00:2443:b0:728:e2cc:bfd6 with SMTP id d2e1a72fcca58-73bae527699mr3093089b3a.18.1744183715179;
        Wed, 09 Apr 2025 00:28:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESg2B5Bgf18C053iwwb0g5HFnwB/pafIw2r0sRvy2X7sP818cIRamnoEWrGeL5ap2y7LWEiA==
X-Received: by 2002:a05:6a00:2443:b0:728:e2cc:bfd6 with SMTP id d2e1a72fcca58-73bae527699mr3093063b3a.18.1744183714791;
        Wed, 09 Apr 2025 00:28:34 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e4f797sm613435b3a.137.2025.04.09.00.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 00:28:34 -0700 (PDT)
Message-ID: <25fc01c0-f5cb-ff31-7b03-af51dc2a27c4@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 12:58:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 2/2] wifi: ath12k: Introduce check against zero
 for ahvif->key_cipher in ath12k_mac_op_tx()
Content-Language: en-US
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250403082207.3323938-1-aaradhana.sahu@oss.qualcomm.com>
 <20250403082207.3323938-3-aaradhana.sahu@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250403082207.3323938-3-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f621a5 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=wZnWngPLgcQuxuQgH9MA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 5RltwI5kT542o5TjArqHx1a7ZitSdPsp
X-Proofpoint-GUID: 5RltwI5kT542o5TjArqHx1a7ZitSdPsp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=820 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_002838_354420_B1FED6F8 
X-CRM114-Status: UNSURE (   7.99  )
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



On 4/3/2025 1:52 PM, Aaradhana Sahu wrote:
> Currently, ahvif->key_cipher is compared with the enum value
> (WMI_CIPHER_NONE) inside ath12k_mac_op_tx(). However, ahvif->key_cipher is
> set using the macro value WLAN_CIPHER_SUITE_XXXX which seems inconsistent.
> 
> To improve code consistency and readability, introduce check against zero
> for ahvif->key_cipher instead of comparing it with the enum
> (WMI_CIPHER_NONE).
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

