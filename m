Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944BEC4345F
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 15:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBuE6eCNbDqZR1Pi7BGBtW/65ideVjIyYr55hOtH7Zk=; b=z2b0YOVW6z7imDR5GLouy/uuMM
	HEsoSWcnOHYQQEiUsXo5rk5JVWOUcyQPcWE2kz2oLGE14wzQOfi2LKlxWX5BmWq1l90K91dvir1Nq
	l8JIPXOAQiXioAu5mH6kEOjPEAlx1L1TLpiBbXpKmxRdsvBZlj5ITZKFNih3lbAqIpwYi+izG3VEO
	ANifDUJQr4ywomNXRAqPEwnpw1OIr37ux7EMaGV3ipPnxUm2KN0RbiO/wd0dvzppYEAeVNaYALbgi
	EokoTHVD5PDh8Z9PE/foJmVH1k0fJGDjzEgFprKavikuOisQC06QbHhg0hKzXN6C1/+B5wLYDyFEn
	HXxhoHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw7D-0000000CgLC-15xz
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 15:13:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw7A-0000000CgIJ-0SxU
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 15:13:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BCWmZj031539;
	Thu, 11 Apr 2024 15:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=GBuE6eCNbDqZR1Pi7BGBtW/65ideVjIyYr55hOtH7Zk=; b=Gj
	hRA7IiTVvJtk6NI4Xe8uuvzXpLiNQe3IYJkvEdKEPXMDvYNx+WKZJBLJhryCV5qz
	/M+DR7SJV2cugzoNZxOWt2lzWmB7uZp6HiRjDtWOHJ5JD8e1wjM8EWph+gaIbJ8e
	lgfxSfMx9CDT/JfyFwEZmiHgS8A7uSKCGrXgx5LWCaL9LXmM3Xuqm3nrsHeeUMy6
	17TPYnuxfwq6ko3ICDmzSqmAxMqTB0J/qZpRMi5BQyebp0EaW8L8J5vwDfYmY+tI
	yG4QPO6D45hxendJa6Opj4oE8+bIBgR/5CMFf41sILYO5ptgfhg6G9Wl5oDG6sjn
	jjvzHNl4vNqYIG1F80bQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xec6dhfb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:13:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BFDFaA019157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:13:15 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Apr
 2024 08:13:14 -0700
Message-ID: <260c6ca9-0d82-4e6e-bb17-9246578bcd1e@quicinc.com>
Date: Thu, 11 Apr 2024 08:13:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix mac id extraction when MSDU
 spillover in rx error path
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Nithyanantham P <quic_nithp@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
References: <20240329092432.873710-1-quic_nithp@quicinc.com>
 <87bk6gz1jc.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87bk6gz1jc.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l4nygddEqEQXdxTMIn7aZzHEdy5Cwipu
X-Proofpoint-ORIG-GUID: l4nygddEqEQXdxTMIn7aZzHEdy5Cwipu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=524 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404110111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_081324_187219_F998E7D4 
X-CRM114-Status: UNSURE (   7.46  )
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

On 4/11/2024 2:33 AM, Kalle Valo wrote:
[...]
> The else branch can be avoided with continue. I did that in the pending
> branch, please check my changes:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6c677d91adad4817e7f6ef65a85331f52f0237ee
> 
LGTM

