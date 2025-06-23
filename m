Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2944C7115B
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOCM1tAGatqvuUpE1vuXd2MaWKze9bMXgr+n8TWjS6o=; b=ELnFcxr5xtneKlSVWyzN7cLmth
	b0Xg46V7MRgHKHKV16pq5aeqFo1ipJZos4OVt/UdNZ8EBZR73jqXdXSuI+GLH5a5vU+QmmbDJGToE
	+kNoMhzrZ08RLTam7La5YtDV+oUT/2+W8jeHRh937hKyUhY/y/It4XT2M48bYXlbDszX8f4d64o3C
	16xDb2IMCt1hYH6SZl4xlUQk2vuorYCycmSjl/gmGzM7jAYzT7LZ0Ck0gVBeVa0NOxRK6xYi29ktC
	DIulkJ/d5GMeVWRSML3wrSP6be3ayMRoZch3GvBbfFGCEnm6VLF6qh5GTBz1EUA6MG7kAiZi8O3XG
	lLyP/TaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzl-00000003hJ8-1hhR;
	Mon, 23 Jun 2025 18:34:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTa-000000036zJ-1mIv
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9pLQc014580
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOCM1tAGatqvuUpE1vuXd2MaWKze9bMXgr+n8TWjS6o=; b=JROfLtqdNL73TSL/
	fmVI8WpkH2TS5+pWTu4PqiPzXJ+Wu0mVPfpRyKsf6jZGPEpDP53OqwTNncIbz3S+
	thVlygQR/ws6ykyKJJzVoofEFbeYMOtMUqS78hS9MaktQVajoeb5/mUxztzjotf0
	wMEgkynMsoPx+BXySEArjZt2SUZrrUvHtbhihRbLwvwMowBYts5enM4fnlFTJJS5
	ndxy9ZxKpscNIJOrHuVnCAb+VnKzAKlisOgDT5S1FhXWkFk6TItXIgM/OKI8s15x
	tU8/CPKWZ5vx34HpssybRzqVgXMjUdrFzIsRWiZAS7Ecsc92kXVPVf74YXHfPdPi
	OSvYmg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5j4pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7494999de28so1053772b3a.1
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690129; x=1751294929;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOCM1tAGatqvuUpE1vuXd2MaWKze9bMXgr+n8TWjS6o=;
        b=XURznCsllYnWq/uSkpV2H9I+t7sL6XeMVAdBguQOx9KMD68VB0hlzPoZfsf4YDrV7U
         9Tr5b1rEfc0kG2s3fM+OTo0vc6hG35nq7c9iMfMHK6qyVts0BI1UpTeOuEZJxZ/71LBX
         5WpNyCopWfQ50E4t0+NkdTTP/+keyduDXvJHQApjTCYFBnSEoQqmLjD7KwmjICUGbYn8
         aGPHOKXVwFA9UtPb8FHJoI+ll5geA1TT2FbmIN7Qug/t/+Z1EUVD0vSmADrcuojGNVbZ
         QI2rikh56gobJhvqbXMe8cRHA6uewlNbhVZMmr/91C8+TysvGGihmZuJRw5ZzEudPdVT
         STcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVZuTb5xj6kXa1d8vFlsRoMY/f5nSFPK1jdNKHv/uCwseYZqEYno04vyQ3/Y92RbZS3QvwtB0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwArhjRFx+BFqBtw1UfyoupEN6wonhPemi0ApmqyQWyHqbhq94i
	SwO6UQ4awwEPWovQaE9aqISlCCrI6SjSKgrIrPwJrG55Tf9wKui6z9ynY/NZdxWz0fq+RZW1qDf
	jG9tDfoS3nMCQbemFwfCe2Eafmbbq18c1Jl+NiGOuz1oYz1fAFK5z3M1xaqxIXEgQ
X-Gm-Gg: ASbGncs0NLad8PSd+QgwiPa/ehCJHK+fwLHB4Zn3qGYic2073tUz9ixYXzOXptW4Jx8
	cOl4K4MRExGosoth5iJ4Cv1+YK40b9Dnb+5u627bxzVTRCD1N0FQcT+k60SlUldV1/81gyBXA1r
	QVdSyP0vBQDrKwi/A9Z0Az7Gayo98nJXBjwmS2pW2srtXVkfL9CbSG2tltvCdGdsaXYkCTcvhkj
	26SE95gnn5j/evz/4cTey8Zxo7M3L8DFL7O2XPOqkGobvArCi4MBiXj/msbbnLSSXjMQ9Xtvbz7
	eyLmPzgZPtIuYHFL9C3m1Kcg7eAASZuCceEcpMDLzK/Sa4ruY2uedbMSUaw=
X-Received: by 2002:a05:6a00:3027:b0:749:464a:a77b with SMTP id d2e1a72fcca58-749464abce2mr4789107b3a.18.1750690129129;
        Mon, 23 Jun 2025 07:48:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlktiwR9SgURSgPFUS0DTsoXi5zB3HvrPc9cZdXpa1GmrQr0LxuniI0dtk0RcrFa5bKCimXA==
X-Received: by 2002:a05:6a00:3027:b0:749:464a:a77b with SMTP id d2e1a72fcca58-749464abce2mr4789082b3a.18.1750690128730;
        Mon, 23 Jun 2025 07:48:48 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:48 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250609-qcn9274-reoq-v1-1-a92c91abc9b9@quicinc.com>
References: <20250609-qcn9274-reoq-v1-1-a92c91abc9b9@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Enable REO queue lookup table
 feature on QCN9274 hw2.0
Message-Id: <175069012802.3758471.12950159281764113432.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:48 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: MErLyMN6TGHgnbDtRATbPuCuuBzxV5Dz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfXy+CfPhRDPwdn
 mcq9x0UkO2ejdxja/KPeIA5V52d5/p45dhqZ8qb7fnIeXo/zjo1jRpTcFyobWky5CrpMH2pR6wf
 BlLPYvfyOg5QEB2tzFqzMAN5oFrkAWnrcamYPqB/xt8CkuBUhilWermj3pRI8THAnk3Iy5OnlWz
 r3ebDQmvZj3KJ6BRErMqNwUsphicSLgBmeSUuSnPwN+NE+mo5OiZeWhrqYduBYdqEWBZWaxoqG6
 /xcBqGyRE3u/am8eLTD3Bgqlth70hZzqP8iS+XmNPN8wyI5jrTO4dwWrBmUMzWN8QMt76gidZKc
 YOExjXycXZuTL7TKUkp2jGVBLRwPaF+9OvxlUl9DR5gfpu+X03kHP2gmbdHpVXvJH5ZrXQn7aPi
 VtkM+KJhg1p26+FoP/neJplE1s7JvpMB6okZZo7BOaZXA9hxOSw+ovhEOkd3RonWM+3D6/jO
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=68596952 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=hk8jstzJOELweJxXsYQA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: MErLyMN6TGHgnbDtRATbPuCuuBzxV5Dz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=908 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074850_488939_0C51CB04 
X-CRM114-Status: UNSURE (   8.41  )
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


On Mon, 09 Jun 2025 08:48:50 +0530, Raj Kumar Bhagat wrote:
> The commit 89ac53e96217 ("wifi: ath12k: Enable REO queue lookup table
> feature on QCN9274") originally intended to enable the reoq_lut_support
> hardware parameter flag for both QCN9274 hw1.0 and hw2.0. However,
> it enabled it only for QCN9274 hw1.0.
> 
> Hence, enable REO queue lookup table feature on QCN9274 hw2.0.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Enable REO queue lookup table feature on QCN9274 hw2.0
      commit: b79742b84e16e41c4a09f3126436f39f36e75c06

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


