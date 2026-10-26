Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A6606A31B
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 22:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SDk7Bxml;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=md5Ubl9F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ermBThkH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ET8ka4qtfEv+EdZP3zMkitJSumzzgQOgC9axB/fU1X4=; b=SDk7BxmlDvQTbm
	/c2c/tpJNkDCxA92zJcHnkrGTwsxKjCPBrjXKhY5fe1vlgEusV3+5nk9a86zZTA/v7Rk8eoMejLoq
	yiBS0f4nsmrLsy57rlgDL47yvYG2sCVuHdYVpt171grWqmNi2tlvM0z0CKwWw75ie20dhVg4MqAWE
	YNs4wKpzl/pUVud2Dithy65/IUWZD5icB27QNFBGng4lTxC4+FBVbOyK5ef37ZhJ1ljmNRN3Rkvlu
	NCYMa32R46ucpTK1Ki42hodFydYTWmnf+1AHwxxxq+LsBIq5m10r/bfi69Gqg5yMqqX15BqKRex+K
	cjU2URGySKdAGB3MwGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSla-00000003Lvc-2GOf;
	Mon, 26 Oct 2026 22:02:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSlY-00000003Ltx-0uLO
	for ath12k@lists.infradead.org;
	Mon, 26 Oct 2026 22:02:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIoIG3488467
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 22:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ET8ka4qtfEv+EdZP3zMkitJSumzzgQOgC9axB/fU1X4=; b=md5Ubl9FMi7cc0ij
	rzpSL01q5iki/iNDVVb3+fQMV88oV81yGYIpIDRpVK3z7mzBPEi3UudJl5t11Itt
	4QGqGDPY/tdsuTMdwirUAYXNAUzkR29bLNEBSeohZB24CIUprGafJ1ZxdoBeBgCB
	FgkNfs0bQ++OW4ud0feqpIFai8nMWwTFYVMSvEK0Ctds6L9dHWMW03yBgwxEIfr0
	HOjgMD3rVhIqFe7ce/zo1mw0l7N97WznagxNemK5SGaZzl0vitCa/uMcIyPgrR16
	/lOW7FZcqzGyB0ubqAFer2sf/xIM/wYkbbg33yOlm648dGqstpb9Kdm7CXaiXeH1
	tF5Q9g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf2nef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 22:02:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso6480880eec.0
        for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 15:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793052122; x=1793656922; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ET8ka4qtfEv+EdZP3zMkitJSumzzgQOgC9axB/fU1X4=;
        b=ermBThkH3Pt0sH9LdyRGKI1jWPwizRQ4vN5pkzVAJapd0pLpWaYFHbMoXaePpRKdGy
         TT9Smttn7u6lZPgzyXW57kVUpCJ6JXIqVoRItEnsM9fFJH0PYFiU98Dj7TSuN9ebhNXH
         LRc8CB+CGi1WXM1mEkTzgwAtiZWFOW534HUZTipxvwH2Te7bhlMsyZJcGUIjIq1ui13I
         lJvr7eKM5I/QrrGB2nwxUCys4GdRP8mdcHGOvGse+mhKiCtBz5WmNXKUGWNw0tFqij3/
         HA57+a643EazZxXFoEWugbAoAVpObXSlte3sS4MLLGHO8YxYixRuwEFbnJAyRzBRzp/Y
         NOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052122; x=1793656922;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ET8ka4qtfEv+EdZP3zMkitJSumzzgQOgC9axB/fU1X4=;
        b=iCCUEP6WZ7XevM4js9oJNGoxvXFfs/QoqE5z/1vh6hoPkFvRDd4YhZIt8VsptyOBo7
         JE6gp8AtK0g3Xf7Hk8Bj4DkjqmP5PzEw+UPStJp1q9i8HXVBAtMrHSarDUFPscoevMcE
         nb+VwNpELMJUHT4CSpDm6HdTE/yKvbP1L87Jkk14A3pFvb14A0VZ0Px5UBjeQMZdkEjN
         wNPrCur6VgrNg9Lesa4QtmaWHTcftq0M0bskxOKSRQcJwakf8EINzFe0cwMOeK+TvbIU
         AhiMNZNq5W6Ibcjq8p1KGTQcBlegn3MZMpVU54pm1obPFn8BI3W+SpiuThS3Mwv89jnL
         60RA==
X-Forwarded-Encrypted: i=1; AKwUvBzAnL99pkQgHbag1sHcfEcaKbwd/IOXI8Y3SJljxuJFRuKLZmoO08j99i1JITWDhZbYev6giaU=@lists.infradead.org
X-Gm-Message-State: AFq9FYKCl/LL5ASPp3G67DjOo9EITpUkMs2KMkk1FegFjo5MaBlozfAd
	NM3vrZkfJv68xbHhFPSwlDmbc9GDWPMb1xwNySy7EHSJWaorwYdhoWgaoGbPWg5zqlpMAHV/Vjx
	lKuMx0Juz4wsWsUIIShZallC8mdS9MsrxIgHceqLhLbAIe6vW9TD5k80pNNVBjQlu
X-Gm-Gg: AYBFou1fBbcycWmZsepQS7oRr1BzcBn6J+IFidY3fJ3nZtF6ddLVTTg59x0Qgo7g8G4
	QHSP0ajl95d2eZasBV3kCUGtqEET6sc1TDMFkJpUQAhsGyozsyD+NR3fCHeR3vET+G77NMIUxF2
	OWlsDDzjBFLKcTtxwSkxFZ+UQvAo6pzz5Ojl2c4T8yyBsfWrSVF9dC15liXnfXOZdrHbrbJXUxi
	Ldt8U4dEt9o9GkdVT7SoWNQ4kAEh7MWcQQXHvRnrbf+hgkO8cCWZxiB7Vz1WdZnADsD5PV71rQO
	YjToBjghGRxj55Pt2G3Nsm2kAFcpv/oOU5VJj71auzdvPqA/eQdktC7bcrYlSOE9GJ1HKEPmMhd
	L7v2uLR50yUtnFXi/PDiEeeuNtRxkx/7xx4x+3MVxrxnWpAuq9p+2aw==
X-Received: by 2002:a05:693c:41cb:10b0:36a:279:c93f with SMTP id 5a478bee46e88-36a0279cf79mr4893357eec.33.1793052121981;
        Mon, 26 Oct 2026 15:02:01 -0700 (PDT)
X-Received: by 2002:a05:693c:41cb:10b0:36a:279:c93f with SMTP id 5a478bee46e88-36a0279cf79mr4893031eec.33.1793052116612;
        Mon, 26 Oct 2026 15:01:56 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a03bea5d4sm8443486eec.6.2026.10.26.15.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:01:55 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Benoit Masson <yahoo@perenite.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        stable@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260928213322.98949-1-yahoo@perenite.com>
References: <20260928213322.98949-1-yahoo@perenite.com>
Subject: Re: [PATCH v3] wifi: ath12k: assign device id from the WSI index
Message-Id: <179305211480.3326479.9381266425749962152.b4-ty@b4>
Date: Mon, 26 Oct 2026 15:01:54 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfXwQi8wjBiy9Cs
 h+1FQQrORJzYO9hUBzhO7zNLX3p0Xo5eCdJ6hKcvsjBp834Mx2zsYicCrafYVmrFp7CXZPvS0iv
 CU1uqV1P2t6WKaG++2lc92qWrNZ1yuU=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adfcddb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=go08DCD3T2PDlqsEJcsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: cGi6WIMr47LHfauQtwVYEChiCUGF4od3
X-Proofpoint-ORIG-GUID: cGi6WIMr47LHfauQtwVYEChiCUGF4od3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfX6JaEZniOuZVB
 Uq6Ovw68HpFPvo3uPqG/5lMyc0UdohnNmTlIgSjEVWt7LjWYN40p6jVZWeLACY4gcLKJyezGstf
 23+DJ5DyqGHrJNKV7zVsJbksXnVD1DsDzja1AeqhShinJIPmExWZICuK5VIHdkEGbcCatJx/TcX
 55rXC8zRGfq8Wt49K82ziyJHjixY0s6HFcSHRGc3OPaBEiKAlW4Orao9TS92+shrM98ouYBQuxv
 NMUGYNaDDt1PJVyVUGejc1ZP8PmBBJ9rZc4FVtqzP/p8FCR/Kcul1NoSSdDHmlzl/lQbHX92BRi
 +eRIvQEsyuE8XXUIzZbSTw0adtHG7YkmyZQY+iIPiznI3KfyQgyZE7qLBUEbi0b+b81QpRArybQ
 gdrd7NmjWRJbWcQTnWM65oBZMVVgbT8Rw7cfkWSXBfGfVufCMFBRzamLYWmRjJtWQCKvyMiL+qw
 4yH/fqrw+Tyz/QLB5Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_150204_401681_8828A2A8 
X-CRM114-Status: GOOD (  11.51  )
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


On Mon, 28 Sep 2026 23:33:22 +0200, Benoit Masson wrote:
> Devices of a hardware group are added to ag->ab[] in PCI probe
> completion order (ab->device_id = ag->num_probed++), which is not
> stable across boots. The wiphy radio array is built from ag->ab[] and
> the wiphy device is taken from its first entry, so the wiphy sysfs
> path and the mapping of radio indices to bands change on every boot.
> 
> Persisted wireless configurations reference radios by index (e.g.
> OpenWrt/hostapd "radio0"), so such a configuration attaches to a
> random band at each boot. This affects any multi-chip group with
> single-band radios, e.g. TP-Link Archer BE800 (three QCN9274/QCN9224
> radios in one group).
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: assign device id from the WSI index
      commit: 81986a81f09fae73926c7c44863b335880269c90

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


