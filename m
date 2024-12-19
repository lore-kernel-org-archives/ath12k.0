Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA36DE77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 11:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5YC7ebuc+lMCHIQ3VM/pOuoAPe7RMBg+cimf6JfoqM=; b=yYgtpmMH9yCPspX61LCKmv8Vrd
	o4PVY2iWzmC2rKELZbZ3iA0oDD13JoAIaBGg5nI/AsMn5vez8cW3dD9V0vdtBr1eptEPG7ipliDrK
	feXWqQ9V8gfm5txOtV4vCUFW5hzAEqE5iafdpeN6gRXrmv9/egZporAc4Ussm2xnIvirH0X/yHbVc
	TnMNHcwZe9KQcZSr+iPvR30OiAWAB16jeYlvqxISAJfSRWqijiBgWTdFO43JZtbQbjx4llslNGbyP
	SiLmZk5I0keD/rVUQ6mLwu1ZVgP3r4RLjB273jUZTr3JztkGu4Knza/YkGEVkNc/KKTma4qp73xZo
	rWJkNXxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEvO-00000001h6v-1tK9
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 11:42:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEvL-00000001h6c-3fum
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 11:42:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJBWH1c026543;
	Thu, 19 Dec 2024 11:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5YC7ebuc+lMCHIQ3VM/pOuoAPe7RMBg+cimf6JfoqM=; b=C24S+QRrTcUB85Pk
	Xv7IEhgFrQM/KzXLBbizOe8VdkBozD0t3vzFs6tZHwDb8UwPMNlIiRUjZzAzvjzN
	NPgj6JQEM6XejotphYIvXB3o97FWBFZNQ8yEk1mHLqrXubcsoRl6gi42yDQO+hzA
	mAgrYTlz8qN0URKDxXPuvVbYPP67UlUdrAwL6gek8v6J33PSEa1Hv8TOZfme88GE
	wIHBPv82ArJsfvZrtP79IJSCxvJ5QOKNTRMCvjED5SCt33JPB9fTW7EBpI7s15kp
	EnEwZZ0jwMtieorJheFbCgrdUSnLPOBo+EPcUP7LWiTO6IMey9lrFsh3BdaDpbZG
	nQZIdQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mjpyg0vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 11:42:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJBgVLY026358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 11:42:31 GMT
Received: from [10.50.7.133] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Dec
 2024 03:42:29 -0800
Message-ID: <44bfd319-caf2-7459-f62e-0f61de452a84@quicinc.com>
Date: Thu, 19 Dec 2024 17:12:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/3] wifi: ath12k: Refactor Rx status TLV parsing
 procedure argument
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241219001006.1036495-1-quic_periyasa@quicinc.com>
 <20241219001006.1036495-4-quic_periyasa@quicinc.com>
 <87seqjj48p.fsf@kernel.org>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <87seqjj48p.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Qu8LiXJff3jP9HYXRy6iQt9AgyacvOUd
X-Proofpoint-GUID: Qu8LiXJff3jP9HYXRy6iQt9AgyacvOUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=360 adultscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_034236_042833_C678F728 
X-CRM114-Status: UNSURE (   8.77  )
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



On 12/19/2024 5:04 PM, Kalle Valo wrote:
> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
> 
>> Currently, ath12k_dp_mon_rx_parse_status_tlv() takes the TLV tag, TLV data
>> and TLV userid as separate arguments from the caller. These argument can
>> be fetched from the TLV header itself. Therefore, pass the TLV header and
>> retrieve the necessary fields from the header instead of passing them from
>> the caller.
> 
> The commit message doesn't reply to "why?". Is there a clear benefit in
> the future or are you just doing random code cleanup?
> 

It benefit in the future for supporting EHT monitor functionality.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

