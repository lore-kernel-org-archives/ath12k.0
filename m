Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFB9C282D0
	for <ath12k@archiver.kernel.org>; Wed,  5 Mar 2025 02:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWIsGuTLIh3N0YMwR9Z7DAC3ZaFXnY+Ypv6rDdVhb8A=; b=nz0xetx6mw+ZC4kM5lsEQmKnN/
	vN6wTx2lfQdi96YOKL2XjXU3Sb7H4I9xhUFQ0oQ6rUGn7ZVLLfOWc6xwr1+fe8isK28KttqTkintd
	y8Md9ZjP4zS2mN2vU8afrZiov1ks8NmLqKYrX6NsnQT0hif2iR0mRTvfUxY9OtBD15s2DWitP7bG4
	opNX4+id8AOCbkRTwQM1ZO9zpedieLzROuNbBw9pGcWQjH9y0cFQpjTOXCXC68qVja0WGDM/pdNO3
	I3f4V5kc7G3lAuJslMWtRECtMHKqjdM5FxE4tJ0mBh47TPInCqM71NTEtu1ZtsoiLFDMHkTRdEDun
	2fUWIY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpeHZ-00000006mLa-0olV
	for ath12k@archiver.kernel.org;
	Wed, 05 Mar 2025 02:14:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdIM-00000006hFW-0HY9
	for ath12k@bombadil.infradead.org;
	Wed, 05 Mar 2025 01:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vWIsGuTLIh3N0YMwR9Z7DAC3ZaFXnY+Ypv6rDdVhb8A=; b=JSDXr1HECr5NtG15gUtRmmsrSi
	qrEkX+QZx2PYo/fs6Ny3cm8j2D6KoPqXVSZ2mpPEF4BQz3VIe73d6Atl6xP+iFSWyaKstrlHAN+dW
	1ozQkUX+AG587I+ieuxRXR6QzA1lqKcUbYClPHEdu/LaiO0WW1Gjw3QM/OIbabFqn4pfVGA5F8QPH
	NbgJLu5z23YfuOAVohq0Qk4hVOy1PAty7PiQ3suWCdnnWiktcilv7Qwspi5hLnVFcRbtOTnx8ogRS
	kffdr7a9ZDtQdLGsTBjvZGz7HYvvWStdQfraFEPDsOms0NjRuIYJY1aNc4p5rm/x/Xk/pucUTVueA
	dbich7fQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdIH-00000000IJj-30I3
	for ath12k@lists.infradead.org;
	Wed, 05 Mar 2025 01:11:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NAQLm014538;
	Wed, 5 Mar 2025 01:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWIsGuTLIh3N0YMwR9Z7DAC3ZaFXnY+Ypv6rDdVhb8A=; b=d5Ua+zCblNoc/VZW
	InL+BJJGfI5hSxCnwcdgQYR6cde6e/0eHtjujvFJ38QZSgMD0OpMfb+qraOXZRSD
	IAgqhscM33Oy8/1FNhPdrfuqLj02fM34OZLFor8dQnL2kTLUUjlhi070KODSB+tJ
	yj9DaSlUzEVFT9UBl+ImexNY8HYtRxyZcFejO4zb7lNxK6rkrUwSuiDh5bohtQmW
	ElaYY3VvL4JXjPb/SsPdbw4fJdyg8LOXBZLhAMxoMwVdYsCnFHM1eelvb3WFEptt
	CfK8moG2Fe7jCFdS0OZSNhtFhwFBDNTbXJbgHJ6sZ+jaxEVYbGn7p03cF6KIlwks
	UVZE/g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vkqt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 01:11:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5251BNgC020312
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 01:11:23 GMT
Received: from [10.216.53.74] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 17:11:21 -0800
Message-ID: <a71f6f08-d123-d172-1b99-edf4c63ce642@quicinc.com>
Date: Wed, 5 Mar 2025 06:41:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 7/9] wifi: ath12k: fix NULL access in assign channel
 context handler
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250222151926.379652-1-quic_periyasa@quicinc.com>
 <20250222151926.379652-8-quic_periyasa@quicinc.com>
 <6eed9dae-7f4d-4757-9d49-b21aff8e802d@oss.qualcomm.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <6eed9dae-7f4d-4757-9d49-b21aff8e802d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M9N6Y_-i1BV_IkniuYbLgjdnI7oVQrtZ
X-Authority-Analysis: v=2.4 cv=LYfG6ifi c=1 sm=1 tr=0 ts=67c7a4bc cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=3-wCbd5yTIyj0ScaWrAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: M9N6Y_-i1BV_IkniuYbLgjdnI7oVQrtZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_01,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=869 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_011130_730143_F7344322 
X-CRM114-Status: UNSURE (   6.89  )
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



On 3/4/2025 11:06 PM, Jeff Johnson wrote:
> On 2/22/2025 7:19 AM, Karthikeyan Periyasamy wrote:
>> Currently, when ath12k_mac_assign_vif_to_vdev() fails, the radio handle
>> (ar) gets accessed fom the link VIF handle (arvif) for debug logging, This
> 
> WARNING:TYPO_SPELLING: 'fom' may be misspelled - perhaps 'from'?
> 

Yes, my bad. Correct word is 'from'.

>> is incorrect. In the fail scenario, radio handle is NULL. Fix the NULL
>> access, avoid radio handle access by moving to the hardware debug logging
>> helper function (ath12k_hw_warn).

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

