Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E43BE7717F
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7k592LKv4ycZ6CD3fLqXfBOIulZOmseYrbaN//IVrc=; b=JUl4mSRB7jgo52JEDYhDdMRK78
	WPFIVr0cQVZE9WdATE/93QXARkSmXAl/R1V+H7TiaGsOetF9ldJXHIxvS8S5lagjw03EPjHO7kUc5
	sYlJGGZZKOihWRAHIvoMwi5Gij05spxMEZ2Rj4nMD7wdmnW86rw1vLOKly5nC+GklZrzP0prJKuma
	gwpd5R5x3CGCjg744Mcwiv5gV4rdLb7Pmr+Noj75IcIiWnVb607BdIJ0x75dfmvd1wkpUaoTEtgQt
	3LCKtx/mPZEvaALnWlqKCokfPWUmZvU/2PjosaPF4MzB/KKDOCCS5i1+jdEEjfp9O+fvaJjT8StrQ
	bo1htp+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3bu-0000000CBez-1Nrj
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 17:01:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3br-0000000CBeS-1I2j
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 17:01:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAC2YIO007505;
	Tue, 10 Dec 2024 17:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7k592LKv4ycZ6CD3fLqXfBOIulZOmseYrbaN//IVrc=; b=XaJqPbE63YYBdKS9
	kUVffvXf7cECNFZbVd2acWmn/xSRZMp3/XBulOJMG5XSim4Lsvrv8/hbyN8MPF5Y
	a2occZ7AOdCIl+Mx3VSvUOfLrA7/2P29+Ohfgn8mFaVN5BT9nEvAWACue76DMXSS
	U/hOFhC4QE/vm+01XGLRyfkxL0bbQAJ0WNiA/5P9tlHJcIhrZBm5BqA4pWE3fIo5
	kQ5+7CfoDmYc3PN0WA0ELyeYXS4S9QBfHYmIezoe2bZkq8AvQlj3Rlduz88oqKnP
	nZur0rf3GEzTwJKNxofCCQp42UHb4e+Ql7Sn77sN0APY+1jObIuHolqkS4PLIg7T
	TcyATw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e21bm521-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 17:01:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAH11tM027891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 17:01:01 GMT
Received: from [10.216.1.219] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 09:00:57 -0800
Message-ID: <ab745c8c-421d-42de-aec7-54c2064cee58@quicinc.com>
Date: Tue, 10 Dec 2024 22:30:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] wifi: ath12k: add support for fixed QMI firmware
 memory
To: Krzysztof Kozlowski <krzk@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20241210074159.2637933-1-quic_rajkbhag@quicinc.com>
 <20241210074159.2637933-8-quic_rajkbhag@quicinc.com>
 <2d86b600-a7b1-4f7f-87ba-c167ec8c0405@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <2d86b600-a7b1-4f7f-87ba-c167ec8c0405@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6Wzrd0FjgKTPeD15VkVnraTvLWM3MxeK
X-Proofpoint-ORIG-GUID: 6Wzrd0FjgKTPeD15VkVnraTvLWM3MxeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 mlxlogscore=982 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_090119_381795_685FEC22 
X-CRM114-Status: GOOD (  11.60  )
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

On 12/10/2024 8:13 PM, Krzysztof Kozlowski wrote:
> On 10/12/2024 08:41, Raj Kumar Bhagat wrote:
>> +		case CALDB_MEM_REGION_TYPE:
>> +			/* Cold boot calibration is not enabled in Ath12k. Hence,
>> +			 * assign paddr = 0.
>> +			 * Once cold boot calibration is enabled add support to
>> +			 * assign reserved memory from DT.
>> +			 */
>> +			ab->qmi.target_mem[idx].paddr = 0;
>> +			ab->qmi.target_mem[idx].v.ioaddr = NULL;
>> +			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
>> +			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
>> +			idx++;
>> +			break;
>> +		case M3_DUMP_REGION_TYPE:
>> +			dev_node = of_find_node_by_name(NULL, "m3_dump");
> 
> NAK
> 
> That's neither correct name nor documented in the bindings. You created
> now undocumented ABI. Even with incorrect name. :/
> 

Most of the Device Tree related concern in this series are from the
undocumented ABIs and wrong naming (use of '_' instead of '-'):
"m3_dump" and "mlo_global_mem_0".

To address the undocumented ABIs, "memory-region" and "memory-region-names"
should be used to reference all the reserved memory required. This should
include "m3_dump" and "mlo_global_mem_0" memory region.

If the above approach valid to address undocumented ABIs?

