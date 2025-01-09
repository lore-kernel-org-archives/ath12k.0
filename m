Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48B2E77188
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 01:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtEv//FL5uwqH9jZP2aaYiicyByEmNKMp7pxXrZBX4s=; b=FhrtmGNNdBAzrji2qu8yr0kG9H
	LzEge0QYWKr1qEkRo1IpfS43zURC0CTj7wFkW/5T8sfBQR3LFI9TPH+faUI+lgjRIduUD/WfCkZgX
	IrmfiJ52dqmtQ9O0MVz3YVeXTflqtT+RgorfKTci9axadezCDIFO+hXQe96Bg+w0pif5qYfOiw428
	3ecJzKhpylqG/RIGz1OFBqyV2SdS6uMRMrNzq2OZOf2g/j6+4ATSeMNlnbL9TSqeD7jHgPWSFSQAG
	xRaKXr1gCIABVChjNjSlmDrhZ82pNSWBcshduOWQyd1rbeZSWxLZw/67NV6GvZaHDBs7LAgDExKnf
	RzGt/+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVhTw-0000000AKZL-25W6
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 01:37:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVhMf-0000000AJMv-3pn9
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 01:29:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508LWKdJ010928;
	Thu, 9 Jan 2025 01:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qtEv//FL5uwqH9jZP2aaYiicyByEmNKMp7pxXrZBX4s=; b=EMySMDgVNAR6Jvwm
	En/YzBHCJda0ZtjxJ7bGC078TEoCri/kclx/NT0bmjnyKzt6Giqw+QdIdutl4P7A
	opfTZvkKcPhLf5NO1b819u6SUDocPY+kVJn2MNzpHOyRrIVSYgo0T6SlzwaLsO1/
	C7f1I1ZMntDa2QdR9Sj3VFrUfiviQrvM7spZjVSQEQPM1SAULQggOmXMxc/phDsW
	/g2ynWR9G8FB0hAN12qVTd4DubIcpYTAUiJ9rdX46teyaJPjndvpSntY+oh9QWw+
	HewKa3ME+w0p3Qj2/2hNu9AmRbr8OiU0L5vxTfIp1ipvR/X0heCZNF0UnbMnqH0r
	fgaE3A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441uefscgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 01:29:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5091TVCT022938
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 01:29:31 GMT
Received: from [10.50.27.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 17:29:29 -0800
Message-ID: <f53a354d-2b63-f9d6-494a-f0003529fbee@quicinc.com>
Date: Thu, 9 Jan 2025 06:59:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/3] wifi: ath12k: Refactor monitor Rx handler
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241224143613.164921-1-quic_periyasa@quicinc.com>
 <b86a2af5-2276-4875-9b53-c3f43392eb5e@oss.qualcomm.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <b86a2af5-2276-4875-9b53-c3f43392eb5e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2iB5Zvn8GQ-CYsrh76mLAXZhumvVll71
X-Proofpoint-GUID: 2iB5Zvn8GQ-CYsrh76mLAXZhumvVll71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 suspectscore=0 mlxlogscore=555
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_172938_066507_B1BDE63E 
X-CRM114-Status: GOOD (  10.26  )
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



On 1/8/2025 9:25 PM, Jeff Johnson wrote:
> On 12/24/2024 6:36 AM, Karthikeyan Periyasamy wrote:
>> Currently, monitor support is not added. However, in the future, the
>> monitor will be enabled. Therefore, refactor the monitor handler, which
>> help to add monitor support in the future.
>>
>> v3:
>>   - Remove the Acked-by tag
> 
> Why?
> 
> If you did not significantly modify the v1 patches, you should have propagated
> the Acked-by given by Kalle.
> 

I updated the code change due to rebase conflicts. So removed it.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

