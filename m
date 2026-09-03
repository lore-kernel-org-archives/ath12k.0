Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6E3C61DD3
	for <ath12k@archiver.kernel.org>; Thu,  3 Sep 2026 19:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7brq4gtKzaK0oXD4cSwsSfxIoZP071ioNUjTeyGb8tM=; b=MHloCX122hXcVQDANGOOTBJQ6F
	GXn6RUnl2txOr89bVHAJlxAphreUU66uim4Ny3H74E3ajyoKQuNAIe04a0WqmZxKuMTAxy53FwFDp
	IOrPm3zUOW9SEwvQnBV3cFpBwcr+3rZITKEqhs6PS5hPuul6Cw9mAU4+isLezqrkhA3P68fzpx+sw
	GHbpidB7TIRRVSN7AL+EUFga4C9gQ1Udc+ulOswtm6N0MLLbQLO7qeCfBgcCB1KM/E/2vKerQGxoU
	tpUPdyhdwSB8t0zndoSIeu42/+BpF24yfZtCnh7CsEZWUJSUAHL3EX+qyFvLKu9WFk5yod+LOSxMB
	JNGw8L8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CiA-00000000QVB-1U2h;
	Thu, 03 Sep 2026 19:02:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ci4-00000000QOX-2JAD
	for ath12k@lists.infradead.org;
	Thu, 03 Sep 2026 19:02:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3Fla417505
	for <ath12k@lists.infradead.org>; Thu, 3 Sep 2026 19:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7brq4gtKzaK0oXD4cSwsSfxIoZP071ioNUjTeyGb8tM=; b=Yz/mwPhJtdFw5US7
	1w0/TaxR0HHdv/1IIgX5OUTA9JOCfjl2RtChUAh46doTJrDHqLnCvQyDBYDWqf+U
	RRsumSw71/4JMsE1nQuc78AoV3Vtu5ZW+XGkBHiYwf5T1NmQfTvqTUQxSTW7K1lm
	1TPzhyItQfxG4SbR7wEwnrp6LskyBqg1+BlWNJjlFE8UlC1rqWby0l8guGFblfuE
	TYdMxLrF8N75udNJBoS8ZpRcVMVNgs+YtY1EbU6Eg0xjALO2IS8H7coIgbWIjavw
	3akTndXxA+9N83m4hKrCf2b/tFEQwHe2esb2ym9XvfEkpFA3GkphTEb+e2zhKdrL
	Y5KEZg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m2y4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 19:02:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso149788a91.3
        for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 12:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462171; x=1789066971; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7brq4gtKzaK0oXD4cSwsSfxIoZP071ioNUjTeyGb8tM=;
        b=cWLW/uGfwvO8MxPV//oz3SU1tSK7iUJScQMFrrnW0633Niu0UGauZ6ixtvzUD9bD2Y
         uveiVtcD/n92ykjsTE4UnJVGaKVdR/BoGhClzpBiEO9dUxmgwQuKUeOOpJXC8NbmuEoB
         B3u2bzVFibvXMQPxmfXtOuKaro+E4kl0kyDdDf45unuGodKJiZOrIaT3coqXoas/IoIO
         erwR2yGkDxwNIEWw1mx6NkEoZkjbJcvJCLPyUeLQVKYtoH9TawsxkwZDw+07Kk4N38hg
         ZSJoiqb8ri1XaqD5jBjipyA9e8LY5mcLm47Niy7zwbvV/OVP7jvyckEjAuHbXHyvBRMb
         HCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462171; x=1789066971;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7brq4gtKzaK0oXD4cSwsSfxIoZP071ioNUjTeyGb8tM=;
        b=ebfzd4CSANBpv2gO0Y+tnUnr8r44qyNxyCf6px4epNeuSML0ovNILHeGWTLcJU/NlN
         XjVn8ZAtShw2luKyUgAm/dq1xSE6+a4h3vpMHWAnpM9z98wijv6D+BHcXSxy6crabDua
         OmS5PyOF0z+UdcxhOMg2BhughtLM7lCjWXqSHTBFqF4uHw7eRX+GCuzvRB47ckJg2ppB
         zds+5C/X7fiZL9gVBPdi3sfvH1X0/DDU3da2jwgMoGbv7AjpKNJxxvoGYGup0WPeaRV3
         Nl3ABIK77hRusnlzgFoUnrQOMGf58nsdEQVA/KgyIdabuRfLUKYuPDfNGjDQOi+P9SL0
         Xt1w==
X-Gm-Message-State: AFuF++m9WIEIdUqkQWWF2eAVF1JZW4ul1102aA1/Sa08MeicKMdONOUx
	NlnbhgaRk/ohUA9yCdqqCi+Al1ZZlM3WN0UdSTYxwLocImbXQ3omz5ViXNuZZZsi0QZ1mA4bVei
	UvZHrTcdMSLvW3p1CvIi3LDazN/U84vLXubtIAtVaTx8yfWdnay+36nNGKrNqykY6oVZkyJ3c
X-Gm-Gg: AYBFou27s4BnvOTfKQ09e03IeXMedvKyUm/SBiIT6IjPQsUP3mEEBWyfyajnJOpwtyG
	WmGo2pgqaptnpGBSvjqrrnw6OQx3CWZwxWl1kNoApxvVAl3gEzQwltvvHtWw+gVOKCNHVuD9ssG
	ZbG4TlFvf9U1+DcVBQgDso9qeuYsN8xNGLUv1l874/oX87u7dy5Cp6Pr++GtcfgVl0cMJLMwcuR
	5FTriOonsJKY5qZuGQKy9I+DrBombygGbf6s4OaHl/FzN+0IRYtqQiDn2SGf9dqu3RHwpzfae8s
	h/i+CtmzUif+LAzlG5mAm18lFd7852BlOX/+TQh5KVGNy3V8vrDGrAxrStAMsJsBAiiHtcCts3M
	/DOoOWjROt7nzn9LoNYIqbT2YTLXaESXdiFvqUD75wBSgLIUKm5/6Lc0=
X-Received: by 2002:a17:90b:534d:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-39b261074d7mr987752a91.7.1788462171501;
        Thu, 03 Sep 2026 12:02:51 -0700 (PDT)
X-Received: by 2002:a17:90b:534d:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-39b261074d7mr987615a91.7.1788462170949;
        Thu, 03 Sep 2026 12:02:50 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:49 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <20260811055902.522384-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260811055902.522384-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entries for Aaradhana Sahu
Message-Id: <178846216930.824911.1142009612663743581.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:49 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 2zdQN2MJYc453His1XDtakMMND7j3WCI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX3dbaFPbTsBnD
 ZigpOnY0MnyZ2U1HlNon9wiNsvtGcT+EUdXYoWRioZAY563vM6poMKMKO/cg5GMcxZxio4KEplj
 pFGHahKptxbArHxrSFnKzLaI8ULBR6kP9DIYUjazDCeKgusSfSPPCflgMZDFMZDZJHV4kYep44t
 fqxZZEMHtJ/3f/Hq0SlilUe0vyBjx3MxdADovCLFUAGjAzbk7J0mCFl3zDABTO1imBC/CmisPhs
 Evo8FBHAT5Tye3yWfcURgKszHVNYgU9tCMiw94vnCbcsLID2dKgXFNFFekl3eCkCc1HZue5XCVx
 5XUm6AXaOzGUFvl4dNtnTZAWR62tPEkHw+dLDxcknhiHoh8+j/IvKmfnxitA1hyA0PMAPjSGiAs
 e2qFvk59ZgAlh0bxU5AI3tUZSpvwyaxuev0vQcsOWoiPQZoC2fHXUDHx3vl2pRIKJEpDzfCojT1
 nJyQR/dRC3StRLy3Mcw==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a99c45c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MmJLLVYwIoFnF89VZ9YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfXz555lbTQH2NB
 KWfJ6Z0CdzHOhfxdFO4/GMVuqO0ivW4xdKmjitSYvdxyanh38yeZ1zk7MvHb2BFlNQYu5g4iCdR
 d6XLMTS2o5OGcFqli2blvHmooK1q96E=
X-Proofpoint-ORIG-GUID: 2zdQN2MJYc453His1XDtakMMND7j3WCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_120252_605534_7F65CDE3 
X-CRM114-Status: UNSURE (   7.96  )
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


On Tue, 11 Aug 2026 11:29:02 +0530, Aaradhana Sahu wrote:
> Map past iterations of my e-mail addresses to the current one.
> 
> 

Applied, thanks!

[1/1] .mailmap: add entries for Aaradhana Sahu
      commit: 52eec2e1fac8fa49ff853ccd30292f85d9751749

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


