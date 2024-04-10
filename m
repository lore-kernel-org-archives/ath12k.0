Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBCCCD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 16:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyCfzJ+9jVMe+r6IZ3E3LuagA65B/j50LQVBt0y3wWI=; b=Bpoab8wrCjDKOkLhX8xfHWuQvY
	rEcRQ8Rf1bf7N6Rjvp3jLm+xo2Gq+86JAEE4zNzSI/bVgdhGIhRAVkwWaTE8QOd1viN8xH/PV2tDC
	6tWboEOeD9Rd69MO5x+A/ZhwnqTs5Iv3BMo1ceh8iAjOssz89JCGXNpqGZlpR0+rTucdgiHC30QTm
	rJd/f4vO9twzuiIRoNFdKJBxTqFmZ6whzPU8665MB1Vibh+sXFsBbckwapTL7frb4mH3OEFqmvee1
	KvvzE78m/p29v5mqyKxNIr6ob73i6Cof2EzMSCFDjrj/IbEt/p3fWpqHMYY5eEStOMDLUdo8NF2Q4
	4ZGssNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubGm-0000000876y-0rGZ
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 16:57:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubGi-00000008760-1I8Y
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 16:57:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43AF0CnP000446;
	Wed, 10 Apr 2024 16:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=tyCfzJ+9jVMe+r6IZ3E3LuagA65B/j50LQVBt0y3wWI=; b=J2
	PeRYm4JslhlAtWGXJG1YguTN3HwdRLrJjeacLaQA0JHP/1T/S23JYpCoHR6glyqY
	zJB7DolASgYXVdkeUxOdiX4deQ+r0ZqzJRRQBNizsR4P3pMiwlTHR2kt23sfKQ1t
	2wWb1Pt75oTdbzhDSIBXaghjCVpssW9HCvFKZZQlqL7qQoo7lm+Qehz1pn/YJx8z
	7gO4i/U77IWtviZK1Mue5nr4kNpAnDJmIhZUFgoFwCsMkzjRn5E1aGq8gXLhTST4
	OEYKni2oqNwrP/LNKApocLnuxveyo9qDd8UMxcQoWSEUMMLNUiDFXZPrNs3J2i89
	M8BZ/tDBkML7W3WVuJxA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdskjhg7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 16:57:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43AGvj7h004422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 16:57:45 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 10 Apr
 2024 09:57:44 -0700
Message-ID: <3ff953f9-d6ce-4e96-9d16-401ddb9ad1d6@quicinc.com>
Date: Wed, 10 Apr 2024 09:57:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCN9274 - x64 - AMD or Intel
Content-Language: en-US
To: david Atkins <david@3adesign.co.uk>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <LO0P123MB4057B28CB310E5A1CEEF92F0D6002@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB40575CCD8D6A3AB863596DE2D6062@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <LO0P123MB40575CCD8D6A3AB863596DE2D6062@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EfaPabW2QWilS0xxEiouYS3akhSFaI2K
X-Proofpoint-ORIG-GUID: EfaPabW2QWilS0xxEiouYS3akhSFaI2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_095752_456844_FC00D9F9 
X-CRM114-Status: GOOD (  10.92  )
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

On 4/10/2024 7:52 AM, david Atkins wrote:
> 
> I just built the ath-next branch for my AMD Ryzen 3 4300U system with an 8devices QCN9274 module, it appears to have a new message 
> 
> memory type 10 not supported
> 
> in the dmesg logs
> 
> [    2.705656] ath12k_pci 0000:03:00.0: BAR 0 [mem 0xfe200000-0xfe3fffff 64bit]: assigned
> [    2.705672] ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> [    2.705885] ath12k_pci 0000:03:00.0: MSI vectors: 16
> [    2.705889] ath12k_pci 0000:03:00.0: Hardware name: qcn9274 hw2.0
> [    3.405328] ath12k_pci 0000:03:00.0: memory type 10 not supported
> [    3.410796] ath12k_pci 0000:03:00.0: chip_id 0x0 chip_family 0xb board_id 0xc soc_id 0x401a2200
> [    3.410804] ath12k_pci 0000:03:00.0: fw_version 0x1011001d fw_build_timestamp 2022-12-02 01:16 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> [    3.431347] ath12k_pci 0000:03:00.0: failed to fetch board data for bus=pci,qmi-chip-id=0,qmi-board-id=12 from ath12k/QCN9274/hw2.0/board-2.bin
> [    3.431375] ath12k_pci 0000:03:00.0: failed to fetch board.bin from QCN9274/hw2.0
> [    3.431386] ath12k_pci 0000:03:00.0: qmi failed to load bdf:
> [    3.431387] ath12k_pci 0000:03:00.0: qmi failed to load board data file:-2
> 
> I'll try on my other test bed systems, but is it expected that this will get further than this ?

I believe the memory type 10 message can be ignored (I've received conflicting information on that)

You need to get the board file in place. Please grab the one at:
https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/blob/main/QCN9274/hw2.0/board-2.bin

And place it in <firmware>/ath12k/QCN9274/hw2.0/


