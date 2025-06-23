Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B988C77B7C
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QQcF4KijTnmo4CAM7plMQGmmxLSWUgfBXkZWIawFLk=; b=bHnLbEBm0/QW2jXef6wB7aoIXO
	cbYRxutmNWFP/ueMUw431ywwy1Fv0R5VD3dY33RuyLNdh6OH2v34nDPhQ2U3EhDZ9fGlB7jCj1tKJ
	852znOGXf6OLgF9eCgvDCXSec6W0DuKx3sArbZWvvjtwRFXXO/VlIAAIKug3uQGMdS51D5rmUJzBs
	vYFBNH39TLbtPvf9pwynNen+jmnGFCnqqMdghQxVg5kc1K3cG6Xia0e/9NgzXnVO8ZM05Lq9LI4yz
	d0xkpx4ZpydaWFIV1voK0zP+hp8096L98FI2eyyWm1CkHwi6tIbdJm03Z1pS4vJGWJEIJZE3jyXK2
	yuEMRs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzf-00000003hD4-2zDw;
	Mon, 23 Jun 2025 18:34:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTS-000000036vs-2heh
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N99054027754
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4QQcF4KijTnmo4CAM7plMQGmmxLSWUgfBXkZWIawFLk=; b=GwJg196s+F4qMl1G
	95aN6f7bEFG3a9QjHF8SIpH3BPTqHhLD7ej1eQRcA14enlOFTdT4OCXf/MnH2ZPb
	6PLwxdC9YLDuGvpMFpSLpELfkhNF13p4DWqAuI+IG4pXBmi7AVwY1nAf9QdArbhi
	qT31TFHP7HwqJ1I7T7vKaspJEEGGcCArH2DXb3w8s5ia7DNqKtM51cBCFjuPZC3i
	R6M99PBmtwYLszua/YJenxbSVUBi62fXqSStVVHaEK6eDzatoSVgq45vqeSNtw/+
	FJcMk0AvdV1qN1od0jVht6g5oNcqOGojw78X5hsIzisYiU/TXJGYeT39HI15uhvZ
	VW7x8A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec2637qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747cebffd4eso3256484b3a.2
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690121; x=1751294921;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QQcF4KijTnmo4CAM7plMQGmmxLSWUgfBXkZWIawFLk=;
        b=vZml58VhDmfrXpIedy+b3sObbRqH5nLVbjMtAQWahSPq7qVKXyrYEjyMS4mFzFigdN
         J8lifQe60gtCCarsvzuCNBQXDALWZOJxGLMdb3lEXrR30hSDWfcx2bpZRKyrCocynw46
         CuFQg3tZCAirdeH2ZWZSIDy08UINV8bccz03tSA43r2FHJpoE6OpE1fSUc6jn6w5roTQ
         7godRtq3Rwq7byT+mXSGXDgXgb8gmB9c6F3j7qZF4F1LWpiydXVzunv84TOI+dnvNygx
         vBxvD6xoGt2Hj4vg9EuWK5qklYFQ8nX7uWynGj2nMhe2ql9HhA9X0zUQk/Z4S91WeuBB
         5GLQ==
X-Gm-Message-State: AOJu0Yz1O5OAfqsFXSXG14YBCjKmd7Uldm2kdshBnoYxbUMDa5P13KIx
	A3DtaoUXuyMXNcYmaZBnBZkzvJKdK4PanobG3D+pQ8+xgrQ+CJkwVFMmhXDbBVM6MAMdrCkdYED
	LyS6ITzg9t4NcRmYq0B2ECbC6FlIjsvbqn9dcdu0f393UIGr9umHLFSsKTL9OwpeZ
X-Gm-Gg: ASbGnctcUgRLMkFDdsPTWZnfKaUbXwwJLWVEjMkukI6EC4w5nHgTqWrSnQAzP/vRD07
	ap+DPuZxrGb/rerFsjCugpe/e9JZqMUaN+2RebtJmvo3vfuTvi55WXNSWclFzrNwA+R/SsVZ24U
	6fNyqnIkY20JMGQ9sCyv9yeX7S4D3siqNYYl7pTJLZ+ZWoyMQb44LcqU0ovlnNQDlCvN1ce9Ie8
	g0nn0fbFu0IiiK8vcwB0OdEa+IQ8lsoCWO7a4vIAWDoLCWPOan0Y0NY1irQpM2NjQHauEIpEmGf
	aGxXjCUu1hMMGmY2uQx4/DHNK/Lwrf2slr/5AhkvZbDPseYgO1iE/tG+ekg=
X-Received: by 2002:a05:6a00:a1f:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-7490d6153b4mr17505889b3a.6.1750690121207;
        Mon, 23 Jun 2025 07:48:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU7ljNy4RONsvNDpfzXhyhZVSUhd4ESFt12iIMNNY7ruvTPxrcr/Vw6kMsSFhGvh4gTnmOiw==
X-Received: by 2002:a05:6a00:a1f:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-7490d6153b4mr17505859b3a.6.1750690120762;
        Mon, 23 Jun 2025 07:48:40 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:40 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Muna Sinada <muna.sinada@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Karthik M <quic_karm@quicinc.com>
In-Reply-To: <20250506214930.3561348-1-muna.sinada@oss.qualcomm.com>
References: <20250506214930.3561348-1-muna.sinada@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: disable pdev for non
 supported country
Message-Id: <175069012002.3758471.9127694924471258296.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:40 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX30F3EL+UJaWd
 AGODTyqZhyUJRQs17qyGJPemSGna66YUDYEBunF+OtkGWErDJuzVaWSGpXtJcNGMVHBrbBtCg7B
 4t67IQYtd3NsufiyzRg022H2eAHT2S3wsGDV24CCqG7HTt1u/uqVhVT3gLCmsmijGxrLiG6aqfx
 +/0/mINOlDk7oNZV8Dh+S1+xnRZC6tv2YORd3cztxDrcJ01lO8TfjFtGJagnpkVVq8AapL94CKi
 7Sj/KwozU3uRCYQo5PH5Qm+GA3jNTXTj2dNJKl+8mEy9iQ0a06RpsM3yO2T2cv5V0RYQpp0+Bcg
 KKFEgziiLbpJSNpae2FVxSgm64z+Gx9+voKqzl/SGyRWknZnlYO6o5lfzFz2Q5MWqNXx8NaB4ez
 XjtryZfW6fj88dp8TrEUM0WuyMcqlu11axuGmI7ZG79svKrOmsTNuXDhu551FOOtRtQFo9oI
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=6859694a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=j1_G22Jgsno5ajverhEA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: nNxZZdyQ3Tk_hAOw6oJtl5Ig60UeSwdx
X-Proofpoint-ORIG-GUID: nNxZZdyQ3Tk_hAOw6oJtl5Ig60UeSwdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=474 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074842_690408_3428702B 
X-CRM114-Status: GOOD (  11.35  )
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


On Tue, 06 May 2025 14:49:30 -0700, Muna Sinada wrote:
> In MLO configuration, ath12k_mac_radio_start() iterates through all
> the radios and makes the ar state 'ON'. Even though some bands are
> not supported in certain countries, ath12k_reg_update_chan_list()
> tries to update the channel list for all the active pdevs and ends
> up in the warn_on for non-supported band.
> 
> To prevent this, disable the pdev when the number of channels across
> all bands supported by the pdev is zero for a particular country.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: disable pdev for non supported country
      commit: 0f9842b0b0e58173ae0d4f9838e4d9375b29a38b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


