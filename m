Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951CEC02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 07:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCh6fpRVxZfb0wcVdl8jvdbFvXgNIaZcScS8t+jItNI=; b=2mHAe0eAUOL6gWse5ZWOjGxRWH
	Z4c++2Z3h0s/D0F8rAy9Tp5YC8es/efHKoQ6ZS5qqyX32boqRNMuKR/Px2sFWx02grph1L/t610Jg
	zCBOYfORlEJj3DPWZLcYf893ch7PErWEHtaF40cptgtmvYxInGwoa0yQPhtUquBcs0PcZQ9nJ7dkw
	4JZukl6kr1+RxuaF7McWX2tAQyyinDtrDq4b0QW/VfUVMxzsIlgCcxqgz78O62bMW+y1bIlTSnzUp
	ZYr4YARmoE7q2BR6KenQ91fh7D+Ob4K8LmurhwvdGLzLojvOjVq0/cCE9MPKekthKXQEqFX0jx9VE
	DMNfquKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tarvx-0000000Bu9l-1Sir
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 07:47:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tarvu-0000000Bu8d-2NYz
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 07:47:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N4UamD006117;
	Thu, 23 Jan 2025 07:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QCh6fpRVxZfb0wcVdl8jvdbFvXgNIaZcScS8t+jItNI=; b=C1zUb/T10Zu3EIKo
	Md49JuBjEsBV1oghNLBGcislzTRjdiTke25dpAZWUQ4kjEb+UE2j4YAyEAQCwZig
	R+9teqazOMhkczywPTdussIZgybiwRLpVKKaOVyQOYKTrhuCJB3BI3hQSQ5h/9Gb
	NUkqko5bgNC4BTbkCkJEjGMUxrZIHTXyLtNfQD18/M2IqD6LclgJFdEjf19Pvu8a
	K5jueIXQk+DQffvq9wyYAVizU6z/RpwDmv/UilnyQ3BNCrCPIanbc7pkUXTsc74d
	zshO7ycNhmwaEU6NRlcf/U745NIGKkxqzJxZUUW11FqXsExYOD8x5FcdYDnbR/rI
	GcyTqQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bet8rcqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:47:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N7lJgI002731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:47:19 GMT
Received: from [10.231.216.114] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 23:47:18 -0800
Message-ID: <e67e6d5f-f9cf-47b3-9374-e7d48d4b68d7@quicinc.com>
Date: Thu, 23 Jan 2025 15:47:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix memory leak in ath12k_pci_remove()
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        <kvalo@kernel.org>, <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20250122084756.817548-1-quic_miaoqing@quicinc.com>
 <b6f99b64-3b11-4a4e-8995-fa18aa4ea203@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <b6f99b64-3b11-4a4e-8995-fa18aa4ea203@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 45GgFZOG7GzmOYtsefYMWMJDP5Cf2gzm
X-Proofpoint-ORIG-GUID: 45GgFZOG7GzmOYtsefYMWMJDP5Cf2gzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxlogscore=785 priorityscore=1501 suspectscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_234722_607358_C6E7B9E5 
X-CRM114-Status: UNSURE (   8.78  )
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



On 1/23/2025 12:30 AM, Aditya Kumar Singh wrote:
> On 1/22/25 14:17, Miaoqing Pan wrote:
>> --- a/drivers/net/wireless/ath/ath12k/pci.c
>> +++ b/drivers/net/wireless/ath/ath12k/pci.c
>> @@ -1725,6 +1725,7 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
>>       if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags)) {
>>           ath12k_pci_power_down(ab, false);
>>           ath12k_qmi_deinit_service(ab);
>> +        ath12k_fw_unmap(ab);
>>           ath12k_core_hw_group_unassign(ab);
>>           goto qmi_fail;
>>       }
> 
> Instead of this, why not move the "qmi_fail:" label above unmap() ?
> 

Good catch, the code base is changed a lot since the v1.

