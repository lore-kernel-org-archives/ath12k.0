Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66F0C3ABBF
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 13:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8dGx5ZXQnOJPW7nhdspPXNU1jTCt4yWyRTSl5aO91M=; b=IJOKuiTX9mpy6C4UrZXrvOnqI+
	3ZDVp+zadi5I5RhoFCop6Q6vziTi7SZThW3RgVFjMU+suV1kSfqcUqu9/0Jdan4P+mNyRH87GcmTu
	64sCEZ4mHp71G+jJKN9wzPV6W0xfC2xG0RtUjyEySxlATH5IJmXzy7NktS2vyLnmIX/nq9nROjdxV
	Ci73gqyyv7mgxn2eYVGLz9+6t330vkhtwacZoPQeXmF0vUxUMXP5O3UfaIiQcUjkGoQDCTcIGsx1S
	WfvhQK3s63M/deikV0/ALYpiZdpTlWDI3d6Hk5+u9xl5TV1oqUJev83PNuIR4mQK/9Q6/winpzZNN
	5NpK7onQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIGx-0000000C5jC-2RDa;
	Tue, 06 May 2025 13:23:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFx4-0000000Bdct-10iv
	for ath12k@lists.infradead.org;
	Tue, 06 May 2025 10:55:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546966kH026557;
	Tue, 6 May 2025 10:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l8dGx5ZXQnOJPW7nhdspPXNU1jTCt4yWyRTSl5aO91M=; b=V2Goup392neAxniM
	5oyvuf9f6joEEKeRzl/rewzT5nfrPE03vLlfANNkO136eAJZkk2XBnNWpwPN7eQe
	BTmpvU6/czL23QM8/qKRY+/KbHtGI1Y378tyJCDF6JIAv3cs+MYAEjYUfGc75x/B
	palgSPR83vm+gQLvnsR271LW5uomryy28wjExvWEHgBIL3WuNRU48Q2LD6KOrL1E
	dwQvD+y36lvLObHgLEw4w/xVRDh1uKVq19MFAaOTXUHLUq+kqTyk5xLzcGdBHN98
	ivF30OyEOzZ3l8IlCIDZb5XNg0sfs0aDI72444R5Kq/RPDXLm56RM0q/REs0P0RK
	DFoGLw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg1x2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 10:55:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546At32U016770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 10:55:03 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 03:55:01 -0700
Message-ID: <ae88ba1a-d5fb-492c-810c-562932584f12@quicinc.com>
Date: Tue, 6 May 2025 18:54:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k-firmware: Module no longer loads with current git firmware
To: Walt Holman <waltholman09@gmail.com>,
        Jeff Johnson
	<jeff.johnson@oss.qualcomm.com>
CC: <linux-wireless@vger.kernel.org>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <CAMb39_ngQs8=FUML5QXMh2RmEZBZ2NwUHefhGoTkGtHat+KWJA@mail.gmail.com>
 <dc0abf98-862b-47f5-ae71-749c68cffc73@quicinc.com>
 <CAMb39_kUUv24q6QUq9B9+TEUMrUhu12-8WJadzB53nMPhcAZSQ@mail.gmail.com>
 <ef81db9e-99cb-4802-b17f-94eb623a8b32@quicinc.com>
 <CAMb39_m+4dNBDbkZmn-rDA7T+u84y-dx1jSfmPNWnse=R1=gCw@mail.gmail.com>
 <18788f02-e374-4aa6-ac4a-fd53bc93754c@quicinc.com>
 <CAMb39_=G_TEL1pbeF_PAZLQh-JOFcncSfqZChPmEj63NjsEOLA@mail.gmail.com>
 <16ccbe02-b315-40d1-8600-232b592d4dd6@quicinc.com>
 <CAMb39_n4tyrzS=-j0L+ekJVer=KiZyDYFhMqrrcpr9py_itU9w@mail.gmail.com>
 <0933d8d6-5b72-40df-95f8-69f6fbbdfde7@oss.qualcomm.com>
 <CAMb39_nHO_TbHPQawdLVY8nt3yt4wDuEHyEuzMa-p5Ab1n94sA@mail.gmail.com>
 <CAMb39_nQ-uyKAqCz1HEUDt5qjszbhzf3oikVcvzHcVwt4_qt=A@mail.gmail.com>
 <CAMb39_n89hBL_GvfXb7Jw9h5-h-+Qg-3GyqvpahL7MT5ewpvJw@mail.gmail.com>
 <CAMb39_=YPYg0q7Lf0sMgTx5QwKOqcyJrZR7kTspyXEDa6qz9Bw@mail.gmail.com>
 <CAMb39_m5Wm-5xjxYEJg4RxPZc1rdq0BkAJk_Q0B9APC3CAeORA@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <CAMb39_m5Wm-5xjxYEJg4RxPZc1rdq0BkAJk_Q0B9APC3CAeORA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5sH1lPW80jfv-v0sBqs3k9gucxH303f_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEwNCBTYWx0ZWRfXxJzwt+EpQVTl
 K7RbxE5CvAGLwBogCKQ3YqPPLeKjWbfdHaXsWvepge73C/d9Fk/o7uy2M1rw405YSKcI+XQB+gf
 IZt6ZzhrSjTLOFUBX4U8V75RNH3fCHKVOC/4tdYeek4WfR+3pWc2jBfd+swDgf2gJ/11mMspZR9
 I6JXsmXwYbC3LcH9i3cuQE3UUJk1R0zjGhrWc1ixr9J1IVagJJmjHZVeVe/N/eAFoNZE3eFiJTS
 +19SWrGjqicGyV/DpIsKgLYlHhWmi/4EFtb9iK68Lbv2caa8YglXfClDoEGUY+zqVpsVnsG1DCs
 DUutNhHwtX+KKMA6IaU3aCzIh29GYbqAWrNlPIvhCBHyqxIlIwq5A7zi3c+Rj2zwFszWjB56AG/
 /9vjovXN1U4fhq5cryp6Y/7HQdY20RIhEfoi0apxizPGt8h+nYPfRxxZ0uvZ3SK5yTczyPK8
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=6819ea88 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=qPgCAv-Wz5QOtFbVBs8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-GUID: 5sH1lPW80jfv-v0sBqs3k9gucxH303f_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_035506_423502_C826FCD4 
X-CRM114-Status: UNSURE (   9.39  )
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



On 5/2/2025 3:02 PM, Walt Holman wrote:
> Hello,
> 
> In my never ending quest for 6ghz WiFi, I saw there was updated
> firmware posted to the kernel.org linux-firmware GIT repository.
> However, my ath12k module fails to operate with the updated firmware.
> I've attached a debug log of the firmware loading logs to this email.
> I've tried loading in both 6.14.5 just now, and 6.15.0-rc. Is this
> firmware needing an updated driver that is not in the current stable
> or RC kernels?

recently we got several similar reports, we are checking into this. will update later.



