Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A8DE77184
	for <ath12k@archiver.kernel.org>; Fri, 20 Dec 2024 00:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrUDHRiJqEvt0TTWtLWXntm3iPCzAJ27Jpur0qArd6w=; b=z7W19DQ1fiHjxN2oKuKQq9TK+F
	QfC2PQxnO4RR7wPKms+/VkJTSGBactUnCBUlj3NxIRm2bASlb/XiWKpFmqIvCq/ihU6AwIZV45qbH
	ZJs/qacdBE2FBjLvehW4fTHPYlJcsvfOR+xWRw0xX2bk5J6OfzKT+OoIhsoeqtXmvzFOhaRigDptB
	JcxulCasZT6jwxBwWvurQAxoEpWUEtnhhJGcA16XO77Sk9SFu2fSieWNwyjRyj4gI2ThADZBmObgP
	lDgvNdNIYKYEae8pevOCLhOIeFPHmW7/ThRskAFZOheTk9SEVb9cKQ5reBevfL44tEKpIs5LyvR+Y
	MTT8Oa3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQqw-00000003T8z-3vl7
	for ath12k@archiver.kernel.org;
	Fri, 20 Dec 2024 00:26:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQqu-00000003T8O-1hEX
	for ath12k@lists.infradead.org;
	Fri, 20 Dec 2024 00:26:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJF4WM9028800;
	Fri, 20 Dec 2024 00:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrUDHRiJqEvt0TTWtLWXntm3iPCzAJ27Jpur0qArd6w=; b=pT1BZCwfTwPMwXyR
	LGCNm6Xwb4cFnq2TXhngdv1uBOj1IYc7F+h1Zt4J2/ePQqKQK0TDxf2/pXPm9K4M
	kFZYZy9WGKfi/f5veB7R0Pfa0SyPXoDbs/jkIdidKtWKtIQJDlzp0agQA0UNJPBh
	xUHhYk/FQXAcD+kvDqm59HW31tnTKoocfvTfz5GDDyJn9tWpG7D5BcL3BHk5jUag
	iItnPMEqQ1dx+2KiGZlLpY/eoLJuyPyovS1oIrY7QMCjju9WcDaPRsTLgs162XGf
	ohuyL/ThKFI/Q3fnmkxgTupXcTIxMbxlAiVIQjBYVlGBcM7lJZ42kEYLlMRIblOt
	JvhoeA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mntf17na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 00:26:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK0Qitc016465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 00:26:44 GMT
Received: from [10.50.43.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Dec
 2024 16:26:42 -0800
Message-ID: <fe0b1e1f-97eb-acf4-816a-bf3093c8bdaa@quicinc.com>
Date: Fri, 20 Dec 2024 05:56:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/3] wifi: ath12k: Refactor Rx status TLV parsing
 procedure argument
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241219001006.1036495-1-quic_periyasa@quicinc.com>
 <20241219001006.1036495-4-quic_periyasa@quicinc.com>
 <87seqjj48p.fsf@kernel.org>
 <44bfd319-caf2-7459-f62e-0f61de452a84@quicinc.com>
 <87wmfvfqq9.fsf@kernel.org>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <87wmfvfqq9.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i8cJ_uRg4SDQBwXTRLBokH5-5Bp8v8ae
X-Proofpoint-ORIG-GUID: i8cJ_uRg4SDQBwXTRLBokH5-5Bp8v8ae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=330
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_162648_470226_5485B447 
X-CRM114-Status: GOOD (  11.06  )
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



On 12/20/2024 12:24 AM, Kalle Valo wrote:
> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
> 
>> On 12/19/2024 5:04 PM, Kalle Valo wrote:
>>> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
>>>
>>>> Currently, ath12k_dp_mon_rx_parse_status_tlv() takes the TLV tag, TLV data
>>>> and TLV userid as separate arguments from the caller. These argument can
>>>> be fetched from the TLV header itself. Therefore, pass the TLV header and
>>>> retrieve the necessary fields from the header instead of passing them from
>>>> the caller.
>>> The commit message doesn't reply to "why?". Is there a clear benefit
>>> in
>>> the future or are you just doing random code cleanup?
>>>
>>
>> It benefit in the future for supporting EHT monitor functionality.
> 
> How does it help exactly? Having even just one sentence explaining the
> motivation in the commit message would help a lot. Otherwise these just
> look random changes.
> 


Currently, ath12k_dp_mon_rx_parse_status_tlv() takes the TLV tag, TLV 
data and TLV user ID as separate arguments from the caller. In the 
future, the TLV length will be needed for the EHT monitor TLV tags. 
These arguments can be fetched from the TLV header itself. Therefore, 
instead of increasing the arguments, pass the TLV header and retrieve 
the necessary fields from the TLV header instead of passing them from 
the caller.

Above commit is ok ?


-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

