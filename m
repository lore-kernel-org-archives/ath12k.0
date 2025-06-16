Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80969C71157
	for <ath12k@archiver.kernel.org>; Mon, 16 Jun 2025 03:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chuF2r5zX2tn6k1m1M4/DBJn+iA0f3ZjuM1y4Q2Cuwc=; b=HCS3MdI3EPZ36fqvUJ+6S2Uswb
	u+WR/h9xFb4kY7hbl3zVN2yj3s1ZDltWUabvqxz0TUPEKVlBOCGbALIQrYmjUM5OHKyrGrdO/Iig4
	xFv7vSlHA3nYImJgrlGpCYQ078nScsToPqjqJ8t0yNpx2CQDzzWIi56+nvEIiy/wkYfDnEwUnaCeN
	4Bccih4DSMHxb/GrM+7oe2L5InzgChixG4b//3j8+hxxxdDvOFQKiRSS6Xt8cmD+HV813mQO7M6yW
	psiHA+rynk+TAj5UEVOJ9d9cFZFGXHa7Hil7CDEdvnRqO6fyW0qirmGNhpQAYT1e518XSYPTsO5Vo
	BcCKBi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR07c-00000003Diz-0bO7;
	Mon, 16 Jun 2025 03:02:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzIn-000000038MQ-0a9w
	for ath12k@lists.infradead.org;
	Mon, 16 Jun 2025 02:10:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNSAeB022295;
	Mon, 16 Jun 2025 02:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chuF2r5zX2tn6k1m1M4/DBJn+iA0f3ZjuM1y4Q2Cuwc=; b=SamYcFMZwNC7GuBe
	frkeeZJ/k4zhMru491AaLRmYqLQjrj9ucuUHroAO6J+Kp0UrSSjgHArDQvbIWlB5
	ALovFy1SGtBPgNo4vyZOIHF5KYV85aEg79JnVM8N0UAgh2jPNWaMTGkxUDMI9CNV
	om/YDPlZmWdddkqmaZNLL6qJ68e8X627q9yRZeq/y6JIoOwoXGeHTeJqaeOFJIiS
	ddrrTP7y1UjP93Kw3tklYuC2qv+ldl0KJUXXCSQrTMKjiPnZO+YxhakxbMFipSrw
	3aVzc7pBNl3v0zilLtik1BP3zo+URmmvAl1Vy+vHtbdcxMaN2m2m42AvLqshbybg
	+yLjKA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enargf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 02:10:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55G2ADt8029820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 02:10:13 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 15 Jun
 2025 19:10:13 -0700
Message-ID: <8e0de439-8593-4000-bf36-ef31fb2fd7bc@quicinc.com>
Date: Mon, 16 Jun 2025 10:10:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: High CPU usage from NetworkManager with QCNCM865 (WCN7850)
To: g <gregoire.s93@live.fr>, <ath12k@lists.infradead.org>
References: <87c2388b-67c3-450f-8257-38855aba0da5@oss.qualcomm.com>
 <AS8P190MB1205381CAC703C21F90D115F8771A@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <AS8P190MB1205381CAC703C21F90D115F8771A@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0Edk7rKMonvIuAqVQ6Lv1YbzOAK_xwJK
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=684f7d0e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=qz0fP-G1StKwavyG2KcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0Edk7rKMonvIuAqVQ6Lv1YbzOAK_xwJK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAxNCBTYWx0ZWRfXz3OCbjqFzBIL
 uqxLIN2gPCjocYs1w/gD48Ro8xHjFsBbTlhEiLKl9mJ33Q5Dd+9IFImAz5A/Gq6nSfYoBa85MDk
 aN0VW+yVL5aQNot6JDey7/vHCJBFVYhWZvDw/IB5bMKroENowPiV8GeO770d9ujpYJFOSgLvg8/
 b6cPysNkRplUjL3lf0WbpwzPzCNUdK8eCdMCK3CBkQvxUF13Es/NId68rpWuPpjLt+6SRrJK5ZY
 coTFRkGwhX8WhNfF7OYRSnJuhpoVbu7UYQDvm+99Onmg52Dwk7oUmA9KC9uImnQHEIEIRfmp6zt
 duy3mXanS1hFyqZglqlpHKY3inEBcxDtUE+KE/PAFITGmTw8RY10iuGZybTFz3xPMaPzSvFmUMj
 hdqtDfeH17W/dRp24hpC7AXCQ7j25koepmk1R/oh5/wK9w5V31GxvDw2eW/58gnhNzYsvxcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=245 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_191025_341315_41B18B3F 
X-CRM114-Status: UNSURE (   5.94  )
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



On 6/15/2025 4:28 PM, g wrote:
> Thanks, but this patch doesn't seem to solve the problem.

Could you merge below two series/patches and try again?

1#
https://patchwork.kernel.org/project/linux-wireless/patch/20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com/

2#
https://patchwork.kernel.org/project/linux-wireless/cover/20250612-ath12k-fw-fixes-v1-0-12f594f3b857@quicinc.com/

> 
> 
> 


