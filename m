Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E87DC54798
	for <ath12k@archiver.kernel.org>; Tue, 27 Feb 2024 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqFVbaI2ge5CGmoL5rEjqqSc8D6jJRi8Y8ZXQxRKvgw=; b=fiZtO8ZODMnkXDs3ju1x7nfxPo
	7odmczX38teGCevX8LSvZIMQ+AlP3aSkZtijqtmcq88/VejpJ4Gs9F6Cs9yQc29hfW2szS8ZY2shh
	ClbpEKQ8/WkYnJVr4hrNJbw351y5AQzp5B1eju2BLGfiUM1mgclFXXElJ1jGpOJMYyg76LjlxuUBV
	c2ODYuise8SAwQZfiXtzet/am6cShTQhp+LnGeIDGGD8r16XEQDQTQVNIK0J+RtSGt9qjWBvfNfjp
	2jud8FlPERL3GOWaRtOSAPGIm34Ufp4ayqmEhhldCPKN6nb6RP0yYVlp7c8nHur+pW5rjRSLvW5pj
	7gg1yohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rezJL-00000005lln-2Fu6
	for ath12k@archiver.kernel.org;
	Tue, 27 Feb 2024 15:24:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rezJI-00000005ll4-28ob
	for ath12k@lists.infradead.org;
	Tue, 27 Feb 2024 15:24:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41RBj2ZH022168;
	Tue, 27 Feb 2024 15:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=wqFVbaI2ge5CGmoL5rEjqqSc8D6jJRi8Y8ZXQxRKvgw=; b=Lo
	eu7iA49yXKqOdEJ1l+DZSCroJsimpIWy27uDzT0QZIXJ4l7JQtZxOVHZWPxMN4Gn
	2gLkOr9RRklsU8xkMTWUS8mNHX2Pnpdwfs43M/Dtt3fqp1s2vc2ErJf+foWybbds
	83xwxRIFumeGCv2sjp/QLtjufzl6AiNiqLw9sPSc78rQA+/IAOf7F8sQwJSNmAZB
	Q3ZHVS3yJydsCaBGMZnxPfA8lf8KkihssAvbrVpCEffzkEKwKXc9QnhwPVpXw/jG
	UL00v9vfJ2qQXt/NtJg5g7gc6NAMYMuuIUb3owEp0WipsEv7ISMUv63qJr06AD4J
	t2ONbYQnUE8OKAvZ7AQg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wh89t1f1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 15:23:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41RFNt9j009014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 15:23:55 GMT
Received: from [10.110.113.97] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 27 Feb
 2024 07:23:54 -0800
Message-ID: <6a5b62d3-d807-4fa0-91e8-fde93d114b36@quicinc.com>
Date: Tue, 27 Feb 2024 07:23:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Performance of WCN7850
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, <kvalo@kernel.org>,
        <quic_periyasa@quicinc.com>, <quic_kangyang@quicinc.com>
CC: <ath12k@lists.infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>
References: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HZvvssnC42CByNf6RGap5n_PI81_Orxv
X-Proofpoint-GUID: HZvvssnC42CByNf6RGap5n_PI81_Orxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_01,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_072400_733380_D1AF67E6 
X-CRM114-Status: GOOD (  14.14  )
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

On 2/27/2024 5:54 AM, Jun Nie wrote:
> Hi,
> 
> I am trying to maximize the bandwidth of WCN7850. Does anyone know the
> performance status of WCN7850 in mainline? It's about 160Mbps in 6GHz
> band and ~600Mbps in 5GHz band on sm8650 platform in my test. The
> firmware is from below links:
> https://github.com/kvalo/ath11k-firmware/raw/master/ath12k-testing/WCN7850/hw2.0/board.bin
> https://github.com/kvalo/ath11k-firmware/raw/master/ath12k-testing/WCN7850/hw2.0/regdb.bin
> 
> While it is ~940Mbps in both 5GHz and 6GHz band with
> Android/linux6.1.25, . But the firmware names are different per log,
> amss20.bin on Android. Not sure whether the driver is totally
> different for Android/linux6.1.25 and mainline.

The drivers are different. Android uses the out-of-tree qcacld-3.0 driver.

> Do you have any idea that the low performance on mainline is due to
> driver difference or TX/RX power configuration, or firmware version?

My expectation is that the upstream mac80211 datapath will never achieve
the same throughput as a custom datapath. That said, the ath12k driver
is still under very active development, and performance tuning will
occur in the future.

/jeff


