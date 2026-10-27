Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6F9606A32C
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 18:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OpylcJPz;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DNh04kEb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F8QKP4M5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wit30iP+wjWokmtkJr6+vqKTT/0WES+HK7+H57YGve8=; b=OpylcJPz9z8jPB
	qxZDkDKVxe/nO1TddSHft9Xu3R/77vuiEEbF0YHmDlR5LwdRjzSVV2jJiAwVogl130wuuSg0fcmE2
	6Lr327WiLI5Y7XFZSWP12rEMuUMY1dly85wISJfWUSug8viIiZqoAD5NsmBBrJnd95MESHDFxyAIy
	zJD2auQ56gwY36U1hqJMG8QtOme4KtuP6+/HwCK9hABIu8mxmZYAILJFojFMnKWYterJu5NlhCyL4
	xNXz7gbSKloBS5Na8+fDTeaDgEoygW3O6B+mSwg+aKEiz4jGDDSKL6CJJJzL9RCQDAxE8mxb/KIdW
	sgE43xGlvTxwcYzpoDxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLmJM-00000005bVJ-0MTh;
	Tue, 27 Oct 2026 18:54:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLmJI-00000005bUe-3RsD
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 18:54:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHWnZ1917358
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 18:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wit30iP+wjWokmtkJr6+vqKTT/0WES+HK7+H57YGve8=; b=DNh04kEbIqQyKqOs
	zAsFkfOjfchzKr70a8dNXUi5DG5I+4Tdb2gySDSRBgHbfOGcXnwkYNpy5u6A5N/V
	BIKtpbLgRxJpVCBxZD2yaT+dW3uIneyNeQl6TE2eOlrsu5xasjotFKACFC6NDNpo
	OkKs1m04l3yq3voXOwkbbFuMc0hMe+rbxK7FiRvYpZ9MgHb521WIAV509+VwmgQA
	mN7tkhd15ZCig3DyTUBkVxupQPkSbhZuATg3e6RoUOniJs2EaFPsxfp6Pi7THLJA
	AB7fHGsZtgBPN5zebiG1i0SDnXU2dHwShsANm/UYbwkVdeU+OmT3WraJuo8COTyX
	G+whEQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux99r3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 18:54:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so546898eec.1
        for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 11:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793127250; x=1793732050; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wit30iP+wjWokmtkJr6+vqKTT/0WES+HK7+H57YGve8=;
        b=F8QKP4M5UK1ULLfDDMfQGKD+7TThB/6lmIjlr/CaUPJ8t0KybHIT6mHpqwDK88CVwU
         kbVSv71wg+pyCxOrIR+H6C0H3cu+Ndbgianp6tUlfdWVR/UlhHCQqT8c/48HcVwuVHzg
         q5Z4PQZ4qx/gFIKUyxSdlTFFhHWKslwE34IB1GbT1TH6TMg1zbXBvLgh3BWJ6rsRvs/h
         9pINFioDC3US8XEEOyPhV0WsafjzhZ0SWtGEXwKytnYwErUYj947X3xIXg34EgKekN+r
         tUW0wQoExH+VnDsQdh2wynTIfQmJSAg7p7g1cZ3XZt66/UEqs55Z9sTrK3UyffQA25OM
         YREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793127250; x=1793732050;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wit30iP+wjWokmtkJr6+vqKTT/0WES+HK7+H57YGve8=;
        b=sezUdb3x7wv0SCL0ZfSk8IgM1+IKIqiHtmIRB2Oob0ERp6V3s8dJ99zYcH8lqYk+s8
         qcEnS2/uTIn7bCBHPk8TOZ2XTjKX0NySsYrgcz9huRw5aaPA1i5RxS96KlSeP3ANGdkN
         q+2ZY1tKTsOnuXI++bYf2NXIzNjvW7e8pQ+Vbb3gjq610SP5YQhuJ/mJZQcoyk5dA77e
         1PdykOrumaLSq+xiYAimJUTVtVs7J82ZotdgjC5JFvwRE9Jk+nCjGWCJEB2vwO3anjoR
         mo5TqlZeXTbuZPk7Hl3k44XcLgn2JiCJLx5xMKyH9I+eer7LUcqD/os/IXLaq8/uLn56
         mxBg==
X-Gm-Message-State: AFq9FYLGQkMdz0XAXQKBOyc7K01FAdjVudbTL4Pg2aVtRXcfgO6WMeQm
	vgdA9fFvfzy6Fa6glrF/L5ypJhHHzz6JAs/CjYD/n1W3kRJYZ53RCDi3t8B7c6WRh1iO7pGsxml
	CFJKnCcymX/s0j1G9jLiQL/d5aGaWnsAdCqxCLWW9veyrHKwBxGdST3v18OtjMEcQ
X-Gm-Gg: AYBFou3MVLvlV5N+Z5G17ft/55N9OsarQX0sN64GINoYsEBZ6p6CXaniyXSqiIgzxoN
	Dw2UgoEzNyDV+oU/zqk1WWMS4OZ7SccD6i7IZv/S9p6UFh0uVsaT0L+Frb9RyZkjAvqqVFGTLJy
	olwvyTnvkae3ig6TpYSIC6SytHOITjkPtVJXQoc0pZNAeNLQpye6KTkon53Vkl9JwVreuamOPes
	rN6jvrgaFzvarlvevazqH/O/N5nQNBi9XR+ovw1QeJpvt2YLataERt4NZn+n0HtpXLIxpYActZm
	DWTpxE/gFKM+ySzIYcrUBddhaniduBw+hjbzHYlX3OEN0BucbQU4NxB0mzsl5agVnHJRkuaZ1Bc
	9jfW+oSMPaA23UZlACTU29epADH6rQnmaa++lbH6j3+jlJT2Y9gEfTA==
X-Received: by 2002:a05:7301:78c8:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-36a20406fcemr338681eec.9.1793127249545;
        Tue, 27 Oct 2026 11:54:09 -0700 (PDT)
X-Received: by 2002:a05:7301:78c8:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-36a20406fcemr338633eec.9.1793127248474;
        Tue, 27 Oct 2026 11:54:08 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a14383b02sm8989983eec.14.2026.10.27.11.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:54:07 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com, rameshkumar.sundaram@oss.qualcomm.com,
        Gaole Zhang <gaole.zhang@oss.qualcomm.com>
Cc: gaolez@qti.qualcomm.com, miaoqing.pan@oss.qualcomm.com,
        hangtian.zhu@oss.qualcomm.com
In-Reply-To: <20261009095538.2718979-1-gaole.zhang@oss.qualcomm.com>
References: <20261009095538.2718979-1-gaole.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 ath-next] wifi: ath12k: Add EHT capabilities to scan
 probe frame
Message-Id: <179312724741.435197.10463767510262088409.b4-ty@b4>
Date: Tue, 27 Oct 2026 11:54:07 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0f353 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lsWWqZO9LB58UUU1DoYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 9Y8cAQLxVl7SRbbaTVGuz7fN8e79F0fr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfX3K/VtAUm8YNX
 t/f+ny/E+J+Em9IXufmlxjU2gFRlpm3LhFJfLOhaVzJzPfQOjPUYKDEX60aaWKRGwmcl0nYu6ZW
 0xdSvb+67Lr2h4IZYkhYWMUT4GSdelOO+OnSUIitMtFyH2fXZT73A22fhxT10tcVy8w7YywK492
 +skbafsiIzIRgtRpE00Swr/k+6AsMwcnrsJM68CL0k5hChtOjL1E9dPz4Lni04AsgRFPv+XL7eD
 80v80+/86zX7YlG0vaIQJm844ZWq9iSTmRIU0Sx5H1xT5Xmut30aTex4W0/q9w0znyMUpuPRO34
 rJqFHgunTP9QRWQXtZ6qLlS/ml88TvnpvVf7z0aY1C4sIQrS8x1nTayB/qC2YuElzFBWT09erTW
 F1PsFj3YjeG8XvWDQqxBydKXuqKF1vDu+24N14xFXixr4Iw4cEGa3aZVuZZUfmKeE1gh03RFHm/
 /cerUadEATrun6Gzcig==
X-Proofpoint-GUID: 9Y8cAQLxVl7SRbbaTVGuz7fN8e79F0fr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfX1p4vJN5S+LH+
 /+VRJ4avtaviS5iKFnSQ/P4Mxheow2uV0IRlhqAHwCtOHUpVVOpghoEHUvLYOWZoFuHpEHJpwOH
 2qct+M1tUcY1xo4v806w6l5h8+SW3rU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_115412_990601_020219D5 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
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


On Fri, 09 Oct 2026 17:55:38 +0800, Gaole Zhang wrote:
> ath12k hardware scan Probe Request frames do not include the EHT
> Capabilities element. Without this element, an AP cannot identify the
> STA as EHT-capable during active scanning and may omit EHT-related
> information from its Probe Response. This can result in incomplete scan
> information and prevent userspace from correctly determining the AP's
> EHT capabilities.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add EHT capabilities to scan probe frame
      commit: 8211010c0c6d17dc5214cdc1e03f00a341015f24

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


