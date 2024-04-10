Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784FECD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 19:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvI/Iu/IpxiLk32oq1jY08q2sd/3S11+9fCL2/2vXH4=; b=Gsn3fVsY/2/SK3ziCGn59Wcm0/
	bPiiFvORl+bNERStzAypuI5R04H+nT43VQqw+flkL9wnztOtkDutuceYOpgLveF8Ds5PZxZM5VDPT
	V0QWo2mFsaSfdVNLKnfiZfNeExSXV5RV31LlK8wGaBqKwMl60s74k5xBL8zxGS/A8rjad7MrlSwjO
	OusFWHc7ZQT324iMiMtDJdLSBzixgoCABV1RK0n1CLbjOSoOC3KzH2xxuhHIaxgGroPfUe95mbzUm
	OADdWvnRnVwaFGTvJCZh/f5CSml3+B+o/AwbGJziqVBDvR1efflUHxStH3Mmf7ZYb+3FC5PcYcaav
	Rm3yFZrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudDG-00000008b3R-0j4A
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 19:02:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudDD-00000008b2g-2bk3
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 19:02:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43ACGSwY008685;
	Wed, 10 Apr 2024 19:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=PvI/Iu/IpxiLk32oq1jY08q2sd/3S11+9fCL2/2vXH4=; b=JJ
	/68EwgxuZtGWzk/MH2NtFPtx4k0dP/xU+Rw7vgxEQb9LOlX8Ij/Q9qoFQ4cRUIo0
	+XN+mAJOwNu1jog8OhaixSTM6Aw0Q7USFRTjOVfix6uwFGVsgDZVyKKvBWAjeGWq
	tyMCfb2ocptB3LeMblgd+sfGsrELchMaWY7LYu4/a/EmJwRpUMidWuSFQkbXmWXD
	JpG/yWxuMB9VXo3CoJjbTPBf3eHCC7zEFMcyzl7nqLq0YW0z36VTJUW54OoJbFMi
	Bfkn7HbKsMAmTdpNLJCBecGn7ssrVAEtFJTUvKKzHK/t2Qla5uEJXyDzhYl8BX1N
	pjrz6WcPZMizqawSkLHw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdqy7tkpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 19:02:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43AJ2HoK001226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 19:02:17 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 10 Apr
 2024 12:02:16 -0700
Message-ID: <e39dc9fd-b4fb-4db1-bdcc-e2119b967c64@quicinc.com>
Date: Wed, 10 Apr 2024 12:02:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCN9274 - x64 - AMD or Intel
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: david Atkins <david@3adesign.co.uk>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <LO0P123MB4057B28CB310E5A1CEEF92F0D6002@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB40575CCD8D6A3AB863596DE2D6062@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <3ff953f9-d6ce-4e96-9d16-401ddb9ad1d6@quicinc.com>
In-Reply-To: <3ff953f9-d6ce-4e96-9d16-401ddb9ad1d6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: irBwxd2WPE0LeNQ-AWUuZQyC9r4uhqPS
X-Proofpoint-ORIG-GUID: irBwxd2WPE0LeNQ-AWUuZQyC9r4uhqPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_120223_802579_8C049082 
X-CRM114-Status: GOOD (  15.08  )
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

On 4/10/2024 9:57 AM, Jeff Johnson wrote:
> On 4/10/2024 7:52 AM, david Atkins wrote:
>>
>> I just built the ath-next branch for my AMD Ryzen 3 4300U system with an 8devices QCN9274 module, it appears to have a new message 
>>
>> memory type 10 not supported
>>
>> in the dmesg logs
>>
>> [    2.705656] ath12k_pci 0000:03:00.0: BAR 0 [mem 0xfe200000-0xfe3fffff 64bit]: assigned
>> [    2.705672] ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
>> [    2.705885] ath12k_pci 0000:03:00.0: MSI vectors: 16
>> [    2.705889] ath12k_pci 0000:03:00.0: Hardware name: qcn9274 hw2.0
>> [    3.405328] ath12k_pci 0000:03:00.0: memory type 10 not supported
>> [    3.410796] ath12k_pci 0000:03:00.0: chip_id 0x0 chip_family 0xb board_id 0xc soc_id 0x401a2200
>> [    3.410804] ath12k_pci 0000:03:00.0: fw_version 0x1011001d fw_build_timestamp 2022-12-02 01:16 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> [    3.431347] ath12k_pci 0000:03:00.0: failed to fetch board data for bus=pci,qmi-chip-id=0,qmi-board-id=12 from ath12k/QCN9274/hw2.0/board-2.bin
>> [    3.431375] ath12k_pci 0000:03:00.0: failed to fetch board.bin from QCN9274/hw2.0
>> [    3.431386] ath12k_pci 0000:03:00.0: qmi failed to load bdf:
>> [    3.431387] ath12k_pci 0000:03:00.0: qmi failed to load board data file:-2
>>
>> I'll try on my other test bed systems, but is it expected that this will get further than this ?
> 
> I believe the memory type 10 message can be ignored (I've received conflicting information on that)
> 
> You need to get the board file in place. Please grab the one at:
> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/blob/main/QCN9274/hw2.0/board-2.bin
> 
> And place it in <firmware>/ath12k/QCN9274/hw2.0/

Based upon further information it seems your card is advertising a board_id
that our default board file may not support, so you should contact 8devices to
see if they have a customized board file for that device.

/jeff


