Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9507C4167B
	for <ath12k@archiver.kernel.org>; Thu, 30 Nov 2023 16:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7GylH7uEV74FGZ99ziYrotPQJbQuu8i+ThZAnWdQh0=; b=Fs+hnXm8D1c7kuc3n9UNHC+RAp
	u6xMAJVqN8KTOYZqzKVZkLwcxtfLSrMrfBP1nF9IzHqt2dlmw0U4GzHWIgfSoUkcQlY/h+LUHPuMb
	NkJAcSun/ZSpgaD7xKKDqtyg7XiyafoNpjHVVHdI4UIOYDu4PTvdAl/AOYR3l52YRi7J9GNUECtF6
	ieqgKaFDbCYUaUcUJ2GnyMbqSeOkpQt3bRs9wNI2KB0SxGPaLLeHMV10gmHKXC9xHGhvijzQs8o0d
	68acIQ6m5LNZLIN4CEr+birv4EcII5ZzpmeCtJ+SPH2zw1wscrLQSGdaA1/9C4LUV58XRrwFeVwKX
	YFtfpWgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8jxQ-00BM53-1M
	for ath12k@archiver.kernel.org;
	Thu, 30 Nov 2023 16:32:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8jxN-00BM4S-26
	for ath12k@lists.infradead.org;
	Thu, 30 Nov 2023 16:32:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUElLGC021574;
	Thu, 30 Nov 2023 16:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=O7GylH7uEV74FGZ99ziYrotPQJbQuu8i+ThZAnWdQh0=;
 b=WKWWQmSgLB2qKreRdQ35ffUNyzXD1HQM41quXa8LnDR1cq/HwY+F8JhCZ9Bp5YYG7C5a
 PekVacTOw7X4BlZuoVpJiA+LotTCCtbEpX4r9rvgAdTcRk1xacvDRBmmM/cvcThPbkqB
 2+CzPF3En0sL0oC3iV88kx+WUVehdIxQbaVLQOAIP7eaUe8EoKZXsNc20TEnO/LIIgu4
 iUobFeVD9PSMtbVURRZI7cu3Mma/Q0QWgmRSHD4RafMH8aVkRUJvHT9snx6hOqDEnZzP
 YfsvwoFG2ba4C7iNFi4CbDIRPHDMypFIjSOiZ/QMH10H/KC8zRQdioN9LjGkIBmmhtRg 0Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upjdq9ucn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 16:32:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AUGW0Ao026578
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 16:32:00 GMT
Received: from [10.110.26.250] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 08:32:00 -0800
Message-ID: <dac4b5df-80e6-4ba9-8612-b840f9536a18@quicinc.com>
Date: Thu, 30 Nov 2023 08:31:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Firmware for qcn9274?
Content-Language: en-US
To: Ben Greear <greearb@candelatech.com>, <ath12k@lists.infradead.org>
References: <864419c3-71e1-49e8-40e1-88bfafba26f4@candelatech.com>
 <bcc2a41e-0d5c-46b2-acbc-fa0f22c55232@quicinc.com>
 <b48f1931-7844-9dd9-7668-0e553385afdf@candelatech.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <b48f1931-7844-9dd9-7668-0e553385afdf@candelatech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YN1D2_8Op7aFe6l-hGu6pq1-ump3c3Ks
X-Proofpoint-ORIG-GUID: YN1D2_8Op7aFe6l-hGu6pq1-ump3c3Ks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_16,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=403 lowpriorityscore=0
 clxscore=1015 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_083205_729777_A1011B2E 
X-CRM114-Status: GOOD (  13.10  )
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

On 11/30/2023 8:18 AM, Ben Greear wrote:
> On 11/29/23 14:49, Jeff Johnson wrote:
>> On 11/29/2023 9:39 AM, Ben Greear wrote:
>>> Hello,
>>>
>>> Where are the ath12k firmware binaries located?  I don't see any ath12k tree
>>> in linux-firmware, for instance.
>>>
>>> ]# dmesg|grep ath12
>>> [   55.381104] ath12k_pci 0000:0e:00.0: BAR 0: assigned [mem 0xdf000000-0xdf1fffff 64bit]
>>> [   55.415662] ath12k_pci 0000:0e:00.0: Hardware name: qcn9274 hw2.0
>>> [   55.592167] mhi mhi0: Direct firmware load for ath12k/QCN9274/hw2.0/amss.bin failed with error -2
>>>
>>> Thanks,
>>> Ben
>>>
>> See if this helps
>> https://wireless.wiki.kernel.org/en/users/drivers/ath12k/installation
>>
> 
> It got me closer, but the ath11k-firmware directory tree has different path than what the driver expects.
> 
> [greearb@v-f34-64 firmware]$ find . -name amss.bin -print
> ./ath12k/QCN9274/hw2.0/WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1/amss.bin
> ./ath12k/QCN9274/hw2.0/WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1/amss.bin
> ./ath12k/WCN7850/hw2.0/WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4/amss.bin
> ./ath11k/QCA6390/hw2.0/amss.bin
> ./ath11k/WCN6855/hw2.0/amss.bin
> ./ath11k/QCN9074/hw1.0/amss.bin
> 
> 
> Which one of those QCAHKSWPL directories I use?

use WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

