Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE6EC282D3
	for <ath12k@archiver.kernel.org>; Wed,  5 Mar 2025 01:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SKEsUBhvI0VNgkwkt/wVqVm3AG1L3QIa5kW/uOemWU=; b=cE+2puRKFnQjkZcQNJzLJMj2m/
	5DakiX7zSa0sVVp5zBCipqVe+0Hf3JRjcHgJB4WFZnse4wFnpZRMSqAl7urnkGqRC1D1sdaNLzSFk
	eVNTowLnNa3CM4iAOxk3s4hJlb9SDreqTMBSV6eY5i4NNy9ZhPn+045FGih1otQjPZKHt325RXRhH
	aJmBYBG5XcTT4Wdh8lbmkjrc6+LV7yb5DIU7It+qui51CCQW4Ii8u3y6R9YKYaUJObXvCfSY7D40p
	TyiZ9j1XI3drWU5L4L9FYA/QnzEasLkY/3iSSR+q227878NwxAILpdxPkQboA8l1zgax8i1/TN5YX
	7Kmja46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdM9-00000006hVS-0lH1
	for ath12k@archiver.kernel.org;
	Wed, 05 Mar 2025 01:15:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdM6-00000006hUt-3pKB
	for ath12k@lists.infradead.org;
	Wed, 05 Mar 2025 01:15:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NA1k2028897;
	Wed, 5 Mar 2025 01:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SKEsUBhvI0VNgkwkt/wVqVm3AG1L3QIa5kW/uOemWU=; b=h6hBYw4YWmC/o4iI
	e9vfmAwg5IjdEYgzYufHRbI9EJp+B7jXvde9wJIAMcC6hWN/fWHQNxmq11PQY1ow
	985XklFWOriLHim6mRwzRAHoBQDk6MCORdMi5pMqEAh0U5J9NccpJ8ljB0kBXe+/
	fpCh0BtRKcYXSyLKsZv54G99Wwmn/XKg1FKmcCo87dGIUpv7TgaDWyX5B3GVdMCR
	JJW63KxKxgVtpLuI7jqPmjQUPZ1ceezFgFH8UtdAzXgu7SYICEPjTffFwJss5NLa
	LGeRiXITreB43YFetKbLHdAi2uslDWfNxWb7XAH5DlH4/8d5xg1+fgVFncMoSpDx
	8ibyow==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tkprj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 01:15:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5251FOkn013114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 01:15:24 GMT
Received: from [10.216.53.74] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 17:15:23 -0800
Message-ID: <40d91ca0-56ae-5e27-c7b5-f857d7552048@quicinc.com>
Date: Wed, 5 Mar 2025 06:45:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 7/9] wifi: ath12k: fix NULL access in assign channel
 context handler
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250222151926.379652-1-quic_periyasa@quicinc.com>
 <20250222151926.379652-8-quic_periyasa@quicinc.com>
 <6eed9dae-7f4d-4757-9d49-b21aff8e802d@oss.qualcomm.com>
 <9177444b-fcd9-4b44-889c-ba38145aac69@oss.qualcomm.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <9177444b-fcd9-4b44-889c-ba38145aac69@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c7a5ad cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Fg5gBSExyk0f5aqvcN4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: 7IcPfu1MLTsBbsa8Ai1XcKTK_TYcHTMb
X-Proofpoint-GUID: 7IcPfu1MLTsBbsa8Ai1XcKTK_TYcHTMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_01,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=908
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_171526_952998_21C72214 
X-CRM114-Status: UNSURE (   8.91  )
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



On 3/4/2025 11:09 PM, Jeff Johnson wrote:
> On 3/4/2025 9:36 AM, Jeff Johnson wrote:
>> On 2/22/2025 7:19 AM, Karthikeyan Periyasamy wrote:
>>> Currently, when ath12k_mac_assign_vif_to_vdev() fails, the radio handle
>>> (ar) gets accessed fom the link VIF handle (arvif) for debug logging, This
>>
>> WARNING:TYPO_SPELLING: 'fom' may be misspelled - perhaps 'from'?
>>
>>> is incorrect. In the fail scenario, radio handle is NULL. Fix the NULL
>>> access, avoid radio handle access by moving to the hardware debug logging
>>> helper function (ath12k_hw_warn).
> 
> (hit 'send' too soon -- I'll fix this in 'pending' if there are no other
> issues in the series)
> 
> 

sure, thanks for the review.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

