Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0352EC54E49
	for <ath12k@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkIb/2DKZCK+gaU9hwZH7KCFlRv9mxSImPBsZYN2TIA=; b=J1EM7MMbpZAF++me0TkrNVQXxN
	i2nrPGpBEoqUgmdCy0EPnefpS1Ysc9Oj1XlC9/9pAbQOX51yp3L/DOhF4g23nCcBKz6vr2Eu2B37N
	do3G/exO1fSjKsu1LZeWLkeyDE9kGxP+dAGwPWrn+vx0c9kB5elfT/SgUzHq0b1Iq3vQ+Hwogphho
	/rFRctHAgsvxigGSzRyfTOQiMM/5e7Ag0CgdJKBS8l6f16Q5psose6F3kDrezCzRwx4a6km+fj54z
	FyHFZe5bRE9fRXqaV2jcuXdSqasmQnfLOpHqJorg7wHs/xWjbamWP2DBBqXdBaLHXXP6jNu79AK7k
	3yBBnq+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfiio-0000000E9Cl-2rb3
	for ath12k@archiver.kernel.org;
	Thu, 29 Feb 2024 15:53:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfiil-0000000E9Ab-2gpq
	for ath12k@lists.infradead.org;
	Thu, 29 Feb 2024 15:53:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41TEu8Pi028326;
	Thu, 29 Feb 2024 15:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=BkIb/2DKZCK+gaU9hwZH7KCFlRv9mxSImPBsZYN2TIA=; b=nb
	jWoXlqxhCJjQ5fKapSj65vjXce9CjVJyuVTB5PMuoG4mS/e23/Q1hg/rv1T+Lgsh
	8OF2bowP1uJPlpms0FJ4vJ1vMhCXeP9I8vEi/tvEFIzdyVoge9VxrspXvZ8gPIC6
	6Y3P5+8z0Gy34+PvPks5nPPTBIvNKVjhg8ujmqLgNeUinW7WkgehTcgWhyvT3S3I
	1XBHu8YnpsksD3zQ7SAwh+YBLY0pbddRnGTTuv2bnbgTmNvEnL0S1MWnA5aRMxVI
	Eh7fNWDjWTngcgSyYZDiaAzO2rxYtll5/Y2Me8yjv52IiGss/6RtlVv9xPBlmvGG
	bqHb0s2TqX65w/uY8Y0A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wjmcx1g7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 15:53:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41TFqk4V023081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 15:52:46 GMT
Received: from [10.110.42.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 29 Feb
 2024 07:52:45 -0800
Message-ID: <ded15bd4-7b89-467e-829d-62b1067e1f03@quicinc.com>
Date: Thu, 29 Feb 2024 07:52:44 -0800
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
X-Proofpoint-ORIG-GUID: Xcdt8wFqS7GK20I5ClPFMtMa3IT8UUwu
X-Proofpoint-GUID: Xcdt8wFqS7GK20I5ClPFMtMa3IT8UUwu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_02,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402290122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_075319_839974_3DC8F311 
X-CRM114-Status: GOOD (  14.32  )
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
> 
> Do you have any idea that the low performance on mainline is due to
> driver difference or TX/RX power configuration, or firmware version?

To debug this issue the development team has asked:
#1) Please change ath12k debug_mask to 0xffffffff
#2) trigger association to 5G AP
#3) reproduce throughput low issue with 5G AP
#4) trigger association to 6G AP
#5) reproduce throughput low issue with 6G AP

Then share the logs with me (redacting anything personal) and I'll pass
them on to the developers.

Thanks
/jeff


