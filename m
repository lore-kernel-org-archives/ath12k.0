Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BEFC282DE
	for <ath12k@archiver.kernel.org>; Thu, 13 Mar 2025 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8H+J0BFpbMXoJ7F6ridgaVy2HeTxs9EwAQi0GNwJ2xg=; b=B/eioz0Z1u0/DRSIRzO0Lb7d65
	oQCsAKTgzb0gDac12it/mrLqAzrLeTwB/5ovhzIWD73Afbno+gLKdJQVIF1sxVLX0d6nTLtUJrEY3
	oFOiiUSCgy6UqeG2VJprss7/uEZLioKiccIlB8mjloPA/cIYlBKv/C6GGRSiEcgvnJyvlYJqPqKaL
	22Z+O2172UUADtsixB7qtOYvb8aDxrVcPt6eHFyDI6yqaDL0cUfWoWtJxBXu5zNpYGFlM7sjQxgAW
	OUXJYgt16mkaF/Q1XF9knqohzP/N4Xo3bDutAGyoQIC8fMc0UCG57ku04ZTaz7HKybIPEy1dWzFjs
	ALtgGePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgcu-0000000B1Z8-1fZt
	for ath12k@archiver.kernel.org;
	Thu, 13 Mar 2025 11:21:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgWB-0000000B0Iv-10SQ
	for ath12k@lists.infradead.org;
	Thu, 13 Mar 2025 11:14:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D8gsSL018627;
	Thu, 13 Mar 2025 11:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8H+J0BFpbMXoJ7F6ridgaVy2HeTxs9EwAQi0GNwJ2xg=; b=JWWdOsYOkzEmXeDv
	bK+PhAzgerILG8cJQHvu1YpZFkqGUmI2WsvU7MyZmN1XVB/mtyzB6grqJIAM6R/c
	xGjVUBrpwKpGS11pA0mksqoKjGa7aqRNbFJr1LdHDXFWIYypFHkzD0uAvPZIulCx
	jhYGm9dXzdUXk2rfokSG5T5tL9ICW85+wMBl+taHQmBsfjmHk40or9JIdWWaJToW
	a40g+IPoG3xgbS9ddSIKCiBqyLxIDvZsnrUqUQb0E4u+iWqLthP66AU1wsKIRlGb
	MAK6d4Va1bHeg+9t+lUYgIlqHZOW83HXRZNXgn96bNHOk5riXpIe6JkebdZi8CFo
	Mpqamw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nwp0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 11:14:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DBEMwR026259
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 11:14:22 GMT
Received: from [10.152.204.0] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 04:14:19 -0700
Message-ID: <165b479b-a3ec-7176-52bb-a5fcf4398c4b@quicinc.com>
Date: Thu, 13 Mar 2025 16:44:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: limit WMI_SCAN_CHAN_LIST_CMDID
 argument size
Content-Language: en-US
To: Mantas <mantas@8devices.com>, <ath12k@lists.infradead.org>
CC: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250310-limit-wmi-chanlist-v1-1-8f0fb45459a7@8devices.com>
 <a44f064f-19fd-16ea-222f-058486698951@quicinc.com>
 <187c8be7-23ef-4bcb-9ac1-cf1882fe3e62@8devices.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <187c8be7-23ef-4bcb-9ac1-cf1882fe3e62@8devices.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: trRjhveMuRcEl85R3bKieOlGvGyLwJLd
X-Authority-Analysis: v=2.4 cv=Q4XS452a c=1 sm=1 tr=0 ts=67d2be0f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qC_FGOx9AAAA:8 a=ltzDYh-tZQuVNFrIBZYA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: trRjhveMuRcEl85R3bKieOlGvGyLwJLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_041427_406609_F0ADF8E5 
X-CRM114-Status: GOOD (  10.14  )
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



On 3/13/2025 3:40 PM, Mantas wrote:
> On 2025-03-13 11:45, Vasanthakumar Thiagarajan wrote:
>>
>>
>> On 3/10/2025 6:58 PM, Mantas Pucka wrote:
>>> When using BDF with both 5GHz and 6GHz bands enabled on QCN9274, interface
>>> fails to start. It happens because FW fails to process
>>> WMI_SCAN_CHAN_LIST_CMDID with argument size >2048, resulting in a command
>>> timeout. The current code allows splitting channel list across multiple WMI
>>> commands but uses WMI max_msg_len (4096) as chunk size, which is still too
>>
>> Did you have any private changes to increase the message_len from current
>> 2048 ot 4096 bytes? As mentioned in a reply for your other patch, multi-band
>> in qcn9274 requires additional changes in driver, only scan mode is supported
>> even with those changes.
>>
> No private changes, using unmodified FW from:
> 
> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/tree/main/QCN9274/hw2.0/1.4.1/WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> max_msg_len comes from FW initialization message:
> 
> ath12k_htc_connect_service max_msg_len=0 flags_len=0x0 assigned_eid=0
> boot htc service 'Control' ul pipe 0 dl pipe 1 eid 0 ready
> ath12k_htc_connect_service max_msg_len=2040 flags_len=0x7f80100 assigned_eid=1
> boot htc service 'HTT Data' ul pipe 4 dl pipe 1 eid 1 ready
> ath12k_htc_connect_service max_msg_len=4088 flags_len=0xff80200 assigned_eid=2
> boot htc service 'WMI' ul pipe 3 dl pipe 2 eid 2 ready
> 

Ah, I see. It looks like firmware does not strictly honor the host configuration
in some cases.

> 
> Is support for multi-band AP/STA limited by FW? AFAIK it works with proprietary driver.
> 

There are no validations done with multi-band AP/STA mode configurations.
So we can not really claim the support.

Vasanth

