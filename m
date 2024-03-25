Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D52EC54E58
	for <ath12k@archiver.kernel.org>; Mon, 25 Mar 2024 06:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EYumqlekwyAdfKYURdX7fvN766C9NTacYDM6UQB2/g=; b=x1q6Rt/AP1yK7HU8m1fTbvhvLT
	oC+CoNUpVrzP0FgBDwL1cX1QOTMGOr+XMS7liXSl3VU1GRsKZqnUt0PR+293wGhB3WX1v893l0BjS
	o4hGBVpbODjd1iMwICUwscJbtXUDi8b3z4A6n8tN3gT7vMCVeml8nY8XmNu5oUSRdEpemfbRFucAR
	9KAdV1AogPoMjt5LT5meNqGM/4ionV9JMAvgP9KIvpjT/dH47nHGFFHwq+/cZefvVJHUtIXwD2rwc
	awcSTz0WkJu22ydxUC2JmqsHnK0OHIivu5fleosT06+H/U0WGNf/ayzUJx+X0ZOE06VcJ4LbjsyH9
	NIsvXK+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roe6W-0000000Fju1-2VIS
	for ath12k@archiver.kernel.org;
	Mon, 25 Mar 2024 06:46:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roe6R-0000000Fjpn-1ikF
	for ath12k@lists.infradead.org;
	Mon, 25 Mar 2024 06:46:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42P4mBwV002573;
	Mon, 25 Mar 2024 06:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=2EYumqlekwyAdfKYURdX7fvN766C9NTacYDM6UQB2/g=; b=GF
	WVn9PmkTTBNMHzCcEuWohwr4kG2W6ekeV2fjdpJC7zS3gZ5gcX19MmgUc41i7pZS
	QQ9bQaFB7UI0s6a12z4Z4h98AxpUKtTLL9FgEsdSguzRbPDNou02b9hBDkUjkvuO
	J/h6QVaDFMJN+6NoDe/z2S8ef7epstJuQxutl3oq5uKKSEPiwU/L+CPjlKjgf2o2
	dFV1GBO6kOJRW25jNLoNC3Qfhm1+fWnOJX1IRfXM0qC0aLIU4GFEjNLBfyqVS9jx
	zgKrR/DeAmYIzyusOl8ygWh/eDlm45ZPTYUXpA6xZAweQyKzorvz4Hn6/Nt2brol
	lTv9I8OrnjFjU5tv1HJQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x1qfbpb6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 06:46:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42P6kYgB006669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 06:46:34 GMT
Received: from [10.201.211.55] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 24 Mar
 2024 23:46:32 -0700
Message-ID: <aaa08078-70c5-e8b0-bda0-f31f7d908710@quicinc.com>
Date: Mon, 25 Mar 2024 12:16:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2]wifi: ath12k: Add firmware coredump collection support
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240322054231.467152-1-quic_ssreeela@quicinc.com>
 <c4332e24-6e17-4a14-999e-71340873f67a@quicinc.com>
From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
In-Reply-To: <c4332e24-6e17-4a14-999e-71340873f67a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sYgvpORXyzKP4rur6ogYCDPIl-6VdyUC
X-Proofpoint-ORIG-GUID: sYgvpORXyzKP4rur6ogYCDPIl-6VdyUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_04,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=936
 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_234639_825560_2827DCD0 
X-CRM114-Status: GOOD (  11.69  )
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

On 3/22/2024 9:14 PM, Jeff Johnson wrote:
> On 3/21/2024 10:42 PM, Sowmiya Sree Elavalagan wrote:
>> In case of firmware assert snapshot of firmware memory is essential for
>> debugging. Add firmware coredump collection support for PCI bus.
>> Collect RDDM and firmware paging dumps from MHI and pack them in TLV
>> format and also pack various memory shared during QMI phase in separate
>> TLVs.  Add necessary header and share the dumps to user space using dev
>> coredump framework. Coredump collection is disabled by default and can
>> be enabled using menuconfig. Dump collected for a radio is 55 MB
>> approximately.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
>> ---
>> v2:
>>   - Fixed errors shown by ath12k-check
> 
> But introduced a new one:
> 
> drivers/net/wireless/ath/ath12k/coredump.c:1: Improper SPDX comment style for 'drivers/net/wireless/ath/ath12k/coredump.c', please use '//' instead
> drivers/net/wireless/ath/ath12k/coredump.c:1: Missing or malformed SPDX-License-Identifier tag in line 1
> 
> Note that .h use /* */ and .c use // for SPDX comments
> 
> Also note that although this applies cleanly to ath-next, it does not apply cleanly to the pending branch, so it will eventually need to be rebased.
> 

Hi Jeff,

Sure, will update it in next version.

Thanks,
Sowmiya Sree

