Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEA1C54E58
	for <ath12k@archiver.kernel.org>; Thu, 21 Mar 2024 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8xCkISWKUCgDTW2fprQv0fu0jqVzU00L5QUJjN+1jk=; b=G+LUdM0cZOQKKKxWurFXlk8ssY
	DFitW/LPUks0hhnO+aEWm9X7jMPpNEVfacMc4loHW8B9zcbeuVmikiPGFTAuFKD56Ngv1P+gNhgWx
	DAKpbEarhhvYeJFyRwsWu8K9RSnvG2wSAsjXb2wOewaVEO5yJfMOBHMTU+GVvFgKGpru3KM9NFcSX
	B3svF9wjewO9bBxoGTNT7+uzl/VKA3j2VKYwydN2haf9/aqZyibf3l5KTfyszgNwlzBnRsMg+9yXY
	RlEmePu0ELoUdUlzXOP6TOg5H/4IKhm42m1glrnhlUT770CBog4XZXW+8DJdACiY1VgWWZKnSTxcy
	1qmlOLDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnP2M-00000004Wq5-2wL5
	for ath12k@archiver.kernel.org;
	Thu, 21 Mar 2024 20:29:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnP2J-00000004WpL-2nju;
	Thu, 21 Mar 2024 20:29:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LJvjIT005793;
	Thu, 21 Mar 2024 20:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=n8xCkISWKUCgDTW2fprQv0fu0jqVzU00L5QUJjN+1jk=; b=kU
	VEFUUZEaQGCXVmdUUn+w3ydR2+A/iV5sXPTWf4X81h5KPcqmUUiKzk/z/4mKN1Ar
	rkCxlipmgxy2YcM8+p2oBYaRo8DaekALPza2mQU+r3eaN1BWkpExjhmzZveWwLUo
	rGI+VCY8j+T74Ud6ikrA9v3+/A6PEbhcBGLJvMKWX1HKnP+Ru/Msv0IqUQR8MmrE
	2apRzChkoaYUjzjYNhmcZKVVMgGl9CWWDnlAUFnbUHVw9gTDG1a4oXE6K3YLpau8
	T8Agn3Tw/zb+NIHiuFWkto6dCkioDsQTfR+fuXA+zENC49aCeWw5cACMvr831VWw
	5orRgR7uord1QPnpCQhQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0pe2ryhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 20:29:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42LKTDNc022444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 20:29:13 GMT
Received: from [10.110.74.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Mar
 2024 13:29:12 -0700
Message-ID: <8addfd55-e2cd-4c53-b4c9-025a385a97c6@quicinc.com>
Date: Thu, 21 Mar 2024 13:29:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Add support to rx retry stats
Content-Language: en-US
To: Hari Chandrakanthan <quic_haric@quicinc.com>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240319134522.4021062-1-quic_haric@quicinc.com>
 <20240319134522.4021062-3-quic_haric@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240319134522.4021062-3-quic_haric@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QjffbKZ-uAaaZCdZgGj61dBXHuFKNyHl
X-Proofpoint-ORIG-GUID: QjffbKZ-uAaaZCdZgGj61dBXHuFKNyHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_12,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxlogscore=804 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_132916_150394_A865E429 
X-CRM114-Status: UNSURE (   7.23  )
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

On 3/19/2024 6:45 AM, Hari Chandrakanthan wrote:
> Add support to count station level rx retries.
> It denotes the number of data frames(MPDUs) received with rx retry bit
> set.
> 
> The rx retry stats helps in understanding the medium during
> UL transmission.
> 
> Tested-on: QCN9274 hw1.0 PCI WLAN.WBE.1.2.1-00148-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


