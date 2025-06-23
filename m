Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED24C7115B
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 04:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oL6nG8GOX8cSTgKalYLdEe0t5pO20ymiGwKegnv5//M=; b=HFnq1zlIEoQo/GsYPsWCxlr29p
	NyqKfokmzkzz53moOcN0V2Jkwkm5UpZPINDvy3+cbjqNOcZK9GFNkkh63AmidsAMpYUjxE8FDNgPF
	FU32GlqeWAMOcbsk31Owswj4h50P1Q0mieGf2pVfJIgqigrTnuuHDcWuM0PRKAUVtjagnkE6+lpgJ
	y+gfPulpylkWSp9mr8D9FxP/YkqL3rZL677baGGtHoV5gWcdSDx/uo/tTkrwAvFMLoRc6ruSQvTMU
	sSPFiJ4vUTERR2fmJRhhm05n5ZS0lDh5/2dbfecw5LVOhuwrzjSXrPZHwAzXXWHifWmhKot24EAid
	P+IViyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTYeB-00000001Xwc-00nS;
	Mon, 23 Jun 2025 04:19:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTYe8-00000001XwI-3Gco
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 04:19:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MNJECI012662;
	Mon, 23 Jun 2025 04:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oL6nG8GOX8cSTgKalYLdEe0t5pO20ymiGwKegnv5//M=; b=HuSINB3TjyObcyuR
	RcmZZe2p1YEZNx5eT8Xk3zpXQsmFYyrJ/2qfVdbgTc5Tl9ozTgFoqusKAR8ZUq73
	mZ9QaAPqToCVIHLx7oX3aBW4Gvf2cv0xUuwmSfGr3V/+Vt0wmlzY1AoSmcRIQjFv
	FwsQzS6tIS7OKoN1wPw0lZLHaih/DW2rz6/CI9ONfgn05NoBgNjLbFc0rqVUEsmS
	5llilajrTEEym6aaTiL5yaaehwvss00gz2Rf9eaQF9LJR0+i8V9VU9nEkgq+8/kJ
	6XmpQQEOD31L/P0MZcH0Ikt+vA3nDVXd5l6kw5kX9GHZX9ebQy4viL0zafqPHyse
	9ruPZg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eud08ehx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 04:19:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55N4J3h6020701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 04:19:03 GMT
Received: from [10.216.31.112] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 22 Jun
 2025 21:19:01 -0700
Message-ID: <783d66a9-1d06-a068-7650-2a58c4023164@quicinc.com>
Date: Mon, 23 Jun 2025 09:48:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Decrement TID on RX peer frag
 setup error handling
Content-Language: en-US
To: Sarika Sharma <quic_sarishar@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>
References: <20250526034713.712592-1-quic_sarishar@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250526034713.712592-1-quic_sarishar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 75mA3c7xbhm0reUAnqyphYI6b-_hxOg-
X-Proofpoint-ORIG-GUID: 75mA3c7xbhm0reUAnqyphYI6b-_hxOg-
X-Authority-Analysis: v=2.4 cv=eco9f6EH c=1 sm=1 tr=0 ts=6858d5b8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=BsdNM8JOicQgXtT25-8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyMiBTYWx0ZWRfXwDN2mCqFGKIO
 Icu1ocds0JBkS2Q6vx5Tc8uotjgTeB8wo8XtdUbBLCiFm5wL5fSAFibVOpWDhAuKiUgKz7cPsPu
 rKEjDKm/pfEdzSBTBjSCi4g+N3QNTJwLQjHcLb82oWGg9Q4yBVXKDk4v9y14q/2bG1K+D1hFyUA
 L75WACoNCLsp5a5NwwmkHnq7Iu3YKliJjd+5ku5ELNKAMCgP0MWukd1ioQUSOtxb9nXu8yKBywg
 6qXTEUoqGWnMXkZhcYgPf+mHG5qEckFCQZrqc03+lKQoRJw6HEVAPJ59siIPThy9VZUc8bywpIT
 Vj3lnvAOJ/jHBNh3V4Tuucd/ALNt9AneZ1MkWoCHfUg/KGQUq1K/W/QRWSlaoGjcexg1nDqIT/Q
 9Jbf0ysjaZV8QLQ9g2g24bpZvKsqtyAEX6hBwn5vtDaO6rV0PDGC2VYANiR6QA8uhl1hW03h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=513
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_211904_824157_CFD21F0B 
X-CRM114-Status: UNSURE (   7.33  )
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



On 5/26/2025 9:17 AM, Sarika Sharma wrote:
> From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> 
> Currently, TID is not decremented before peer cleanup, during error
> handling path of ath12k_dp_rx_peer_frag_setup(). This could lead to
> out-of-bounds access in peer->rx_tid[].
> 
> Hence, add a decrement operation for TID, before peer cleanup to
> ensures proper cleanup and prevents out-of-bounds access issues when
> the RX peer frag setup fails.
> 
> Found during code review. Compile tested only.
> 
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

