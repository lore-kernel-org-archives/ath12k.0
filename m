Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C5F606A339
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 22:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2AftFMgN;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=af0rDMuM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YFNGBkZF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zIKu1svv42yZ7SvRmv7bgacrl6WK3b3yfGRojbwaluE=; b=2AftFMgNDvU76q
	isEj+1uEhC0ehVoYIawdL/IeNPsGa8FCdDtre9nuz42efaIQop9ocKMV4oJLjGrkmFEdrRgLRnR3x
	+HWcd7k4JS78bFdpFLPHLuC/pbBs1dQdbMf7tRmDG6A5ER+Z6x5pcVEEAsysBUIq4s3VN48p5NSI7
	x5FUOo5YsmWgiL5z3uP4/g+uInXRhqMwkCQnIZD8k6WBvXkRHTs7GpQq0GNcQ6cDkOPqcWDHeAKuq
	oDnw+/ymzvJOZUZUsGpuJpE1bYYtFv/yMNa+OgTW0W3Cvn1/hnfgrDlU3fjbxowC9MkaDw2Yl9IH+
	fvuXhcaZEXy64Yl/ZNLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSlX-00000003Lty-36S9;
	Mon, 26 Oct 2026 22:02:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSlU-00000003LtC-2ZjE
	for ath12k@lists.infradead.org;
	Mon, 26 Oct 2026 22:02:01 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIoTN04131658
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 22:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zIKu1svv42yZ7SvRmv7bgacrl6WK3b3yfGRojbwaluE=; b=af0rDMuM7Tqu3iQN
	lmvAcelkotXJ9dZazE8VH7s5Pc0AIhISP5RSmCIXc3AvW0oFdC/jM/eY072D6e48
	GKhhIjggI/Sq0oj9Gp76Nc7DfAMRjhcinpkBMpnyn32Pubs7zv9d6py/e+TPP02P
	fxlhJr7UmlyOHOJUV9YGwpETnvZw6sUzVyKhNAODrs0K2Nfkt6KQsk2kouHDEHjW
	LAhSiwk9+RyUemUkOV/xKWiRY3qmPNZ7ZVd6CGhCr97A9nshgy33TjGvgEyv5ufa
	22zwqjyXLR8TCoyno87iRM4CR3gOSN3BpTKQS6FvRaYH7+RlbRSNV5GgMk8Oi78r
	5UYzEw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xt14x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 22:01:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so3202099eec.1
        for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 15:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793052119; x=1793656919; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIKu1svv42yZ7SvRmv7bgacrl6WK3b3yfGRojbwaluE=;
        b=YFNGBkZF5L3SUHwxaJ9+F+v4xbqe+Bp4X12WmYK5HNQDq1D1iNdF+hUfbsK001r/nb
         KR3T+OI95CfI5knBz5BMMelItVZRxXjzCRMWOIFJx0Sh+fpdvToHPGWaTt40Jzp3mHCh
         jg9R6eOBReFw5gGMlhGKgyyak3oaNOOnm1Ik0/PH/6u+Gw+Gzu8toYVBO7rFnRFg9KiX
         3lb5ts7W64bccRp9x0IbQbQfCeF/ylKxe+M9dF6+3/nccGD5ijYNwR8qqnBe6G7N/b9T
         HzVp1Y5vKbJUCZ64tuBFWZQBWdyJoxeq+dwgxc+aO8BkxxvA/oot9SuuM42QjU7npShi
         0H1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052119; x=1793656919;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIKu1svv42yZ7SvRmv7bgacrl6WK3b3yfGRojbwaluE=;
        b=hm8atnUIah9NQlwDlIT0+rRxSYa+yhpgRtEUbaAGSAgV4WUF45r3CYBvLs25HCYpXK
         XEztPtcp+G6U6HB+3LlkAufqVxQWFGtvgACfaS4hqnRwOqdv0Ikg67Nk80+Z6OVeSsAS
         Uw6hfku+BBCF2zO9790AawVDvezNpjYJInGYjjj/yOa6989GqcvH9H97eizg4UsHbnlL
         RRk+vzMnLChtEwCNFo45Vcv9PLdOwg3xoA+PewF3yAHK6w/vjsunhG0hy+GQ+lVvjyCX
         dmCBB1B3cFPjArfOXUqMZpNR0tAzCfuHpA+CQTA4jbXRUlGUWghL5Jm3AnVnN16e5Cck
         JlHA==
X-Forwarded-Encrypted: i=1; AKwUvByIjNwOf0+l9jj2VyMyRzHtXDnI0iK/gGtG4U57PGVguGxODu944GHm7r9LZ6274vNi2fXSC1g=@lists.infradead.org
X-Gm-Message-State: AFq9FYLRj9P3ymf3DH7h8W44cO3ksU+XOdE3gHknK02bq/9sVfQgLFsS
	kCKsHGFoy06aDchu46sTqb3dXhujQFZ4dIm+Fu25/ppletwQCuzGdW9VzLLuz+VpOFjIxSCv+9g
	R8n0jumoaRWayfQiIn+RahBfjOefP1WelLYGzKctJXdw2Y+0DTQg3ueq+3GdU2LXr
X-Gm-Gg: AYBFou3p63XbXD7KM68ZhyCBg5c01HAIgclWB/TjbPzRJDlPnOXsv/z7HGIpy3Hikzi
	1j+5ud45o0Ce2ofjpJ+baMP7Dl1KKA63fd/Wjp0xx0TXWv6ihFShHw2BcYAK/DhkeueEPUljfnN
	dpGjGl0qej1/pDghBSdFuPGsaadCVg3smufihdJ2SoxMNLnDn4mOTIqtTAbBMQdpE4T1Uekd+tc
	9397WLVeEKxfe1ZWkRMrGWheKZZ5V/7LyjsElNgExu9FVo5MSNZE7cvTVTY33q5uawkrqlJlgnI
	BjVbGG8bqM8+XEn++NOMPSIXedT2/MyLDRBmzOHCOUiFmRv1uClKiKBM3rOq6RCLaIXKMcVIqGA
	1p5Wbnmww+TYr+bJb8KbfYRRVzmLfVnL1g8hwJQFhF0zXhV21itCy6g==
X-Received: by 2002:a05:693c:8816:10b0:366:fabf:6273 with SMTP id 5a478bee46e88-369e8483c1bmr12138127eec.22.1793052118655;
        Mon, 26 Oct 2026 15:01:58 -0700 (PDT)
X-Received: by 2002:a05:693c:8816:10b0:366:fabf:6273 with SMTP id 5a478bee46e88-369e8483c1bmr12138081eec.22.1793052117914;
        Mon, 26 Oct 2026 15:01:57 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a03bea5d4sm8443486eec.6.2026.10.26.15.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:01:57 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Ripan Deuri <quic_rdeuri@quicinc.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20261015-ath12k-fix-descap-multiple-rx-buf-v2-1-4cde055677ed@oss.qualcomm.com>
References: <20261015-ath12k-fix-descap-multiple-rx-buf-v2-1-4cde055677ed@oss.qualcomm.com>
Subject: Re: [PATCH ath-current v2] wifi: ath12k: fix decap of MSDUs
 spanning multiple RX buffers
Message-Id: <179305211683.3326479.10846455612333090718.b4-ty@b4>
Date: Mon, 26 Oct 2026 15:01:56 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: nvVpo2WyT3h4C_a6woBOAtrMlc6e9yHy
X-Proofpoint-GUID: nvVpo2WyT3h4C_a6woBOAtrMlc6e9yHy
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adfcdd7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0_6NbyKEq3xlFscCNSMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfX/kIGHF0n9cit
 oB9sre/78gJ7yzxim38pGK58Irjq1v0o5A3I//2a0qQrkcx+2lqGMTHfWdl5nVIxN5HkIi7E/pV
 Jmv8s+kjiCltpyiLV+Hm4WyamZtjf1bgApgRZc3oPuqNIJwywjpVtLiu2JCrT72Cb1XQTV61jun
 wJOpYH+BOCZnBuKYGYuqSb80ytZYTXS7w2DyXM/7FxLc/EUPQPwIjjEuDewDp7bykQfx9iJ6Eg2
 ZNzuiM1EpEptSgmIFw/WpKpLPuSkCeZU9liposcLItcFrgG7kuzgZJ20kAuGCLnvz645FuH1Fvw
 HLbYvwv4eik5qg8Fq6K6B10iTvFQUkQSRZivgwcfNCbHi5XwjR2K1xZDkbVynfD31zOEVTJbsXz
 MvLEA9lSkd3dnM0ZyQHOZ1E3AsabmaCI/Z9JNfTkTLpQ4dBnpisIK3My/N8irVCwmw4npFG2p5H
 Tm36R/VwEyuAU0OSvUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfX/NUu3mBc+NwZ
 IXpsJphvaZZLI8knfAMVGzKL+lGM2/ocGKjSeq3dUCmDq4ngSHPNzMAdTJPH3XoZGFz6+CS1O3p
 d/FCYeJYW9Be6TS3f6G9WtFkIl8ny/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_150200_678559_6B156C6F 
X-CRM114-Status: GOOD (  10.50  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 15 Oct 2026 11:17:40 +0200, Lorenzo Bianconi wrote:
> When a MSDU is split across multiple RX buffers, the msdu_end TLV is
> populated only in the last buffer. Since commit e8a1e49c6328
> ("wifi: ath12k: Add new infra for the rx path"), the RX info
> extraction in ath12k_hal_extract_rx_desc_data_*() helpers runs before
> the MSDU is coalesced, so the msdu_end-derived fields (decap_type,
> mesh_ctrl_present, is_from_ds, is_to_ds, is_mcbc, is_decrypted, sgi,
> rate_mcs, bw, phy_meta_data, pkt_type, nss, checksum flags and
> err_bitmap, plus tid on QCN9274) were read from the first buffer, where
> that TLV is not valid.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix decap of MSDUs spanning multiple RX buffers
      commit: 1e678e37ff13e45f22d78d802fcefa8f9a0d9395

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


