Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04379C25B10
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 07:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sS7Z+uBcn2WvMfdalHN56CV6i8ELQEN7R4DigxjY100=; b=M46z7QQJnWRnAzwE3vQcd4+oRd
	kZiaAU0abB3ZVIrcS14d3VVb7+NlswGsBdsDxlAwt+SeI6XpEN2MJWcvcognuQYDktXLj2PrXbMA/
	76jiXmoK32TpAZ32xlbEavk1qVsTDctGxszbd29O/ANF10ObyRmi6y2ffZCb0vEUTgS4cUibNlXnO
	1JZ7KJxd7WRzZu7ELABU5qw/7PGWuDfI7GgpTmG2dHDYRDdeIO1ngP1Xvc2X0BJwhGBmk2C+IOCLb
	FCHjdrMCTBWaPcp9FNWMOEHgOTJUV10qjjQDyfeCXjJCc85i+E3QXbftZ35hTwTSpAY5ob0XrhpNa
	zjYHcTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5KI5-00000004IcX-2yLU
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 07:03:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5KI3-00000004Ic5-2Y4N
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 07:03:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44A2tnw0000881;
	Fri, 10 May 2024 07:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=sS7Z+uBcn2WvMfdalHN56CV6i8ELQEN7R4DigxjY100=; b=LR
	d0SCbUEuKJbFTlfSko6kIJ8ZNHnQ4JGnpekOmVpFeYd8lvkhx0UgT8u7obyA6Ni6
	IbkG+nQEmRVRk70JrRQKZti9giCXzcvKBaIPXdr4fmniaUmiW8vo3P5tKuRs+Jpf
	L+7rBTI3HYbPyC0m3DA/rHT8stFAc6n/JTAvkbMGWXsVUnUNlRs7thgiHDt60CpV
	Cknd/z0EizDQ7gDtZNDIc65/jUVDWRIvrvJvEt2iAticx/jPlK8lA0vm7dsOGjuB
	2G1xyMYPISshZJLD1Z6KPXwTlqOYULzv4/l47G3O1YxNUUnExBoglNXg7dsTIlrq
	OIhp6CtBlEpuazebRsJA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16yt0tbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 07:03:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44A73XF4013313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 07:03:33 GMT
Received: from [10.216.26.103] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 00:03:31 -0700
Message-ID: <7c486b27-fc3b-4f94-74af-bdee3bf905f1@quicinc.com>
Date: Fri, 10 May 2024 12:33:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] wifi: ath12k: Fix Tx Completion Ring(WBM2SW) Setup
 Failure
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240509161631.3520506-1-quic_nithp@quicinc.com>
 <7153876e-2270-4bca-a47a-d45ca165fa34@quicinc.com>
Content-Language: en-US
From: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
In-Reply-To: <7153876e-2270-4bca-a47a-d45ca165fa34@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PIv0irB3C5Xmjk_xY3xFIEjHGQy3sTdw
X-Proofpoint-GUID: PIv0irB3C5Xmjk_xY3xFIEjHGQy3sTdw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_04,2024-05-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 bulkscore=0 adultscore=0
 mlxlogscore=710 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_000335_819300_98BB5435 
X-CRM114-Status: UNSURE (   4.63  )
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

On 5/9/2024 11:02 PM, Jeff Johnson wrote:
> you need to version your patches
Sure Jeff. Resending the patch with v2

