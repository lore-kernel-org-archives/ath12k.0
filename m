Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EAEC83000
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jL53GIzW1YQNgAFT0SEfQ3DPFkMmRybAJPTx5wu0aeg=; b=HBVOD7+W2mHzqND5ZfYissdDoA
	Wl9maq93YUl4OMvhAZ10LIg0FfO52Wqsj5h7HYBBJlIFShRG227gKk7WkSWNWmpSqPUaqFuvXayMJ
	m3iz2Z6tTdvkSERv8za/P4CTBAAJKuSe7QhbsIdxsM++LiyM3hqanMvbrCWLs4k08gI+dKkSgFxuD
	3ygRw3dcPQHLpNBzsoU8GgoHE6SJIksYVzMQRNuIMFli8jEX63672KBzOx6cn1LSamQQeYd+cKB+v
	qLH/BN6/N8UPSXZWgDHrUauXibbSbduDv+cRjFSO+7EMPzFZIgJ1n+J48vEvbFL1BIgFA550rzH51
	nls8J6Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzj-00000003hGJ-0hiQ;
	Mon, 23 Jun 2025 18:34:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTZ-000000036yI-1Emc
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N935rF015379
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jL53GIzW1YQNgAFT0SEfQ3DPFkMmRybAJPTx5wu0aeg=; b=LokQaH8QqZi2vENR
	Ces2iAzH6yh4+iVrYszhyrIomYFqPep8nsbIgT/carlBBoiuhIo9736lt1QO+PYE
	KwNARHUp12hPLkS3s35kMMH6qWcnEKjKDqurKcDmOry4BdtVdSk/w+dIjnRzczgZ
	Z571Jhbt3qomssVMbvNllvtYry1d4ZGOc46/cGtHmI14Yv6yUC/Rq1AgyVWnq4VS
	OnBukJgvGmaqwrXohqS5BcXA1tmn0x0oYR1PPce/jzp3+4zx/Kj/L7H4Ytu4Tb+F
	Y3IUwNqyfvvmoU/Ndnxf9rImj0jV7AnnX6ChuDyfSF6jqml17Msra3WKdHSivfAY
	30Ikng==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3xu10k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748cf01de06so6158245b3a.3
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690127; x=1751294927;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jL53GIzW1YQNgAFT0SEfQ3DPFkMmRybAJPTx5wu0aeg=;
        b=M+ouqSZPJ89kJRzwAHRjC/tgzExotrrnasLThQHiUzbRE3BmA+4Jpz26T6BgiTUjip
         Ir6PzbNFaC6M1QSNcoyKkHXhpsnuMVorWUWL4jG77zF6HIz4v2lefap6Gn9+CWW4Kb5R
         B4yl7NaHfqZ5NoQjhaXo+ZYWkTKOgAj4Iufiw5GX14L9fpcZ53Fif2U30oj22SjY8BNA
         yZyk6h4tofjHm+gbBG3trymQUpye2Oq73a1Zv6LlaE8b6J4JNW5lnq0p2WwQCO0UfpYz
         4oYueJE0oUwZq2OrsOqG6ZPpOXiloz4CdLPlWf4UtDZpd9dScLlwH29/65p69UAFhHL2
         mHtg==
X-Gm-Message-State: AOJu0Yz/4iOZGmJuNWcc9Onn2ny5apHX2xBiEzLjy7+YGQ7l93nhhOay
	rkaMzlL65HIxUVW5WZGkQWd/PmQ5NunCD3UlzjCaTvIG4NSoqgStvOiPR5n9utCFU7K6yUaNLM+
	2sAZH9cnwp63Zf7APzXS4rCECl+sFJlGzms+TS5CsdpcN82Pl+F4nuw8YvSqhpPCY
X-Gm-Gg: ASbGncvXaarWL1tmabdWfjZ/Y2GybOV671U8n+gYKaiGDvk4+i1bs6abeKPtxYGIh32
	G2HA040r19L4WAOPIY50lMpn/g81/nGLyhldhYqVzT97Dhm8ZC4ZRb3kQILflhWMi2DykrgjfvQ
	gxTYGM/HxOttznlMxJAq9wqXOBDpqiVGXQpgtZdctEOzBnATGiFBD9THZyZkCUXMIOLiRvsiLO1
	TzavC7L9k45ti+oWdjGrzDDNkadhttQFQipFxKrIdpdI8hxHgGleMCaCKHuBx+d8jzS9YLmleQZ
	6cg5C3CPUnTzsC18bvgn1/WZs63deW4Hwt1swoWxanidxAOeialozriXXLA=
X-Received: by 2002:a05:6a00:2441:b0:749:bb6:3a8e with SMTP id d2e1a72fcca58-7490d66362cmr15485869b3a.1.1750690127082;
        Mon, 23 Jun 2025 07:48:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt+zgIJ645NaXccJiszRqJetvGZMio30LcEgL+EDMn/ttkXKdbZSgYKM0OLlfh6O2Kc0etRA==
X-Received: by 2002:a05:6a00:2441:b0:749:bb6:3a8e with SMTP id d2e1a72fcca58-7490d66362cmr15485841b3a.1.1750690126646;
        Mon, 23 Jun 2025 07:48:46 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:46 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Sarika Sharma <quic_sarishar@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
In-Reply-To: <20250526034713.712592-1-quic_sarishar@quicinc.com>
References: <20250526034713.712592-1-quic_sarishar@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Decrement TID on RX peer frag
 setup error handling
Message-Id: <175069012591.3758471.12085244120695537046.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:45 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX6Pdh0w/Au3YB
 s7BDOCxfLOfnb5NndMoOQ/B0gFuZHs6FDXZiernIMs9y42Iq6vKE3qdTgm6PmOEYvowZYu/kE97
 hJ71kZxB0akqIK61+0D2GsgcfjjhHskIC39LAMNlYKnykBpZMIPIV87zxOTdCtJRUSWq+QaB4/t
 KyBX5RUcyJ680FJvk6abdOYCXQOrXVetgx95Q+XP6asSuNaqy4ibCRLAoTvDMzuBbVUvXKL8tVn
 Hk2gc5LNZ1HMjLkzs1EyOIyTxCqXNdzsd05TT/xBlm6gaZTgWnPpo/pXnZWhPz0xNqtFqnNVeAY
 4V34Dms7rUi3ZNEvFUnzEI7qk1pUQWec3i/vsEASGgGA/drJNf/OAuCcittUYdQWS0boOJZirBM
 CrzfvwMdPtvOx0FeizW3OKQkSXttBHeMOlVDucCLqHcwX/B+Om0h/Ho0cwY0rIqPDFq0DHk+
X-Authority-Analysis: v=2.4 cv=SvuQ6OO0 c=1 sm=1 tr=0 ts=68596950 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=BsdNM8JOicQgXtT25-8A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: ONKWALgOzTXp5y-eVrEB7khnPYI6zhiF
X-Proofpoint-GUID: ONKWALgOzTXp5y-eVrEB7khnPYI6zhiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=631 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074849_457335_92CFC299 
X-CRM114-Status: UNSURE (   8.76  )
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


On Mon, 26 May 2025 09:17:13 +0530, Sarika Sharma wrote:
> Currently, TID is not decremented before peer cleanup, during error
> handling path of ath12k_dp_rx_peer_frag_setup(). This could lead to
> out-of-bounds access in peer->rx_tid[].
> 
> Hence, add a decrement operation for TID, before peer cleanup to
> ensures proper cleanup and prevents out-of-bounds access issues when
> the RX peer frag setup fails.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Decrement TID on RX peer frag setup error handling
      commit: 7c0884fcd2ddde0544d2e77f297ae461e1f53f58

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


