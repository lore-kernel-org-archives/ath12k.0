Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89257E77180
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cm14pP88CRhNiTOQ8GYtAJupp2D8aI5rYN6Y/TVNe/o=; b=cexviLXNPixDCXz2tqUHSkEW/H
	r4XL1Rt05eS8wX2OiLZYl35Mvkujqt/CmwXVQQQQs4emBNCeKr2y+uNPnx0Ws4FMnWlAjdJbfMaRh
	oVvQ6wccgnecgU316zbDKAMP6U93DAbPIoM1SS9qwIRTcmX+4oGNq7LUPV2adW0l83gKvLt3gsAcO
	MshsWAftAAdMqyD7GR14KIkH9u0a9Sd8BLXB14gpjXxDvmIWmHApVpjzMVoAHAjG2IIEoYW5oPb+P
	p1Z+sBE9DH+sX9uxJJeqwZpaAFZFdZvZYPjsMLFSwA0Xsl0kXx5phXbQJwuwdE7Rj1j0MktWWHqOX
	9q8TR4bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgOJ-000000003Jg-1OyZ
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 10:25:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgOG-000000003JI-0ndg
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 10:25:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7F56M029041;
	Thu, 12 Dec 2024 10:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cm14pP88CRhNiTOQ8GYtAJupp2D8aI5rYN6Y/TVNe/o=; b=loEQeAiPjUBybB1O
	DklsttfxYkCNzFkaOBJGw1y7RvHkmonErJiQpF2IzGPBcM2FcapmsvRB+jDMpRp+
	ifEzlQ/tnzN0cSzcdjr/NmKYBisnJqqKxKxEHSRRrDNg7SercAKp13+3NihKy/rf
	ZVvd9FSYCg274dBJF0GhL6ZImF7uQacqMy5vEQXOudTCvP7W4RPqWVWATWnyqZ18
	Hx/Bv5uVDYMwGm7gmdBcP+zYz0OKzz0NkGAmsYsfGGwQY3GLkUBnDqmQfdKxO2E9
	Tev3UzxKA2bJvQgiD8sbOC5kLrm1l5uwPE2Ju0DCa1aRp7QOdHzvzvRucKFGKaii
	RbWwAg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xtj7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 10:25:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCAPl8K012315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 10:25:47 GMT
Received: from [10.50.0.236] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 02:25:45 -0800
Message-ID: <41f9caa8-9ff4-1442-1b74-e9e967245fe0@quicinc.com>
Date: Thu, 12 Dec 2024 15:55:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/4] wifi: ath12k: Refactor ath12k_get_num_hw() helper
 function argument
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Dan
 Carpenter <dan.carpenter@linaro.org>
References: <20241212004906.3087425-1-quic_periyasa@quicinc.com>
 <20241212004906.3087425-4-quic_periyasa@quicinc.com>
 <87zfl1pcgs.fsf@kernel.org>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <87zfl1pcgs.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Hs6QDzLpmnXK45EGY_EKBSZvhaSmYndH
X-Proofpoint-GUID: Hs6QDzLpmnXK45EGY_EKBSZvhaSmYndH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=782 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_022552_353833_A12954BA 
X-CRM114-Status: GOOD (  13.81  )
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



On 12/12/2024 1:19 PM, Kalle Valo wrote:
> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
> 
>> Currently, the ath12k_get_num_hw() helper function takes the device handle
>> as an argument. Here, the number of hardware is retrieved from the group
>> handle. Demanding the device handle from the caller is unnecessary since
>> in some cases the group handle is already available. Therefore, change this
>> helper function argument from the device handle to the group handle. This
>> also fixes the below Smatch static checker warning.
>>
>> Smatch warning:
>> ath12k_mac_destroy() error: we previously assumed 'ab' could be null
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/ath12k/3e705de0-67d1-4437-97ff-4828d83ae2af@stanley.mountain/
>> Closes: https://scan7.scan.coverity.com/#/project-view/52682/11354?selectedIssue=1602340
>> Fixes: a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per device to group")
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> I don't get how this is any better but of course I might be missing
> something. To me this looks like shuffling code around to shut up a
> smatch warning.
> 

It just remove the dependency of device handle (ab) for using the helper 
function ath12k_get_num_hw(). Now the caller can directly use 
ath12k_hw_group (ag) instead of forcing to use the device handle from 
ag. Because there may be error case where no device present in the ag.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

