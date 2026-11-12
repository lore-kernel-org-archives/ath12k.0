Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3BF606A331
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 16:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aCQkl5un;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vk7tVejQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dSE3QSDO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FsrS7ZAKV95I17yNbcgQPjCjXYkWTNP9phg2HLAD6MY=; b=aCQkl5unfBjYZ5
	MoSTjtgo4K/BPaTeD9CDhOmPjZWttl748DstiNQfV3xTI7+FKw2WBOX8JK618pBXM3/XM2fSdDaCM
	jZij1zF+S75hLmkSjfFYEjz5RApvyLMocbPOdUOPLRbAMt9TV7beSsQoDueBKrxZGRXLGLn56vy2I
	WsnrI58/GOv+uwjeKN9BFl/Qj7VzZmrRqjpD2GCTdtePa8tzpMcy3ENQ1Gb3N8lrxM8KsTNcV3cip
	USL1nSFf3JMn012UxVtEf4/RLn82eiFrGTyQblHbA90wILsUPuBz2SnzDq01TFjWt+3YvqgjWsLvJ
	+VXSeHrd1ggWXtRLyrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXzQ-0000000Ag2d-4B1A;
	Thu, 12 Nov 2026 16:49:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXzL-0000000Ag1I-18WM
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 16:49:31 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFaXEE1594154
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 16:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FsrS7ZAKV95I17yNbcgQPjCjXYkWTNP9phg2HLAD6MY=; b=Vk7tVejQY2qmJmKT
	u7FPB0+6lQXGCVm+EcQ22A94OwNx4mIXU4h68v6AP9NA1Du9N7hSK2yf6iNUmg6D
	DEGmWtCP2fHVtq9xJ7nrwuhpAsn9jfOsX5Y29Awb2ca+WBFEcNwszL763JYIWgFG
	MaL2EFlsE65ZbpSbfoPMORohiYA5fNJdPMAxXAQOjBs57q883G4Re2z1VUUNJ1Lz
	KPNLuK1shOW07zJLZnOvRnYZRJ3eB2ibp+HgcCC8nmiOGEDPvlQlhyoa5WKzwBD0
	vPnlNEGe9SoYMF3JJoJ/ywCbEB52XLO/sf4kw5c2sPB5b0vFJ68zOcEkLKN/6PIK
	FSub0w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8ksx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 16:49:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so71497eec.0
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794502166; x=1795106966; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsrS7ZAKV95I17yNbcgQPjCjXYkWTNP9phg2HLAD6MY=;
        b=dSE3QSDOz55Z+acLzYmWFV5ojhmH8X0Irz9U4UowKCyE9+HzEzoJi/1vRmA9LsrgUl
         2flcdpyVOfpgGugIMwPUde6EV9afIGNms6YCQ1zjU50CXcabiJKuY/Mek2By+mZeGmfZ
         nicBVBcpceQ1xCOzySLNO9BdLmp5TqHY/IrEYYnI5f3J7qxA1AIvpZ7zIB/DECsvHQs0
         sVPGUkG9P9AJQilapDoWBI4s05RCbB1rTrjS7J2LNVnQ6OVRKRPcPamG3z3bUPslOUqN
         2j5v51yVBDzHNAlukKvYCd1CLt7bdgxSPES1rELlo+39mbaLSoJrpDXDorzuiJD7sLAy
         dPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502166; x=1795106966;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FsrS7ZAKV95I17yNbcgQPjCjXYkWTNP9phg2HLAD6MY=;
        b=KZbUivYW8Pr0N8dkmU6n1mHQACXrTq+k9HBdmEfbSw2YWQyacH5zvNLBoS26S2mu5A
         J2s5sGsqBHJDbI2FY6tUWmnb7jh9CjzH/kkT2RLtwkG1jUlULVBR+CiHg7cC+XY1MnUe
         xjTDCjYkzieYqKt22uTxQimGcu1QFtSTsHN0jOcCi/rd6M9dkJHcNMz8wnH2KTZdQZSO
         Ik6cEQl7Zz+4efLQW31QQqe5CxVC07khMaZFndrc/6XtD+MHVeOeGNPBsvqtjiPEld8X
         M1eJ56j8WdvnHrISNhYdWqCawnzyY6imW7z1CUYAG1TSqmrTb86DKQ1IlKTzmK/V1/da
         wpKA==
X-Forwarded-Encrypted: i=1; AL+hErHerdARaDKIHvzdcKqrCLY1+26cIbcYzVzc6JlPvTwTYrDmhjjS8AaUaQn4TGAISwwkPVAIBDI=@lists.infradead.org
X-Gm-Message-State: APuU4Z8/FJ1QLMN+TXnC+5w7uSSJ6jkkVj8Ns7BewrPKWe7ak2jopUzL
	KiI04FrlaX/Wdtjydjn6ocLqRsZUFTobas9AgzcObthhbG2Hvxtcj2sjpad/xAqO0/7i5ncGBen
	UYn3SElywnE03lFR+zHGNbCaZ8L8fxeE5r/PeDvej58b86+8DLNJDcjYOraBZF3TC5hrbKCHD
X-Gm-Gg: AYBFou3svFkLzKd4Sp3AXM0d7Q7n0hJ7dXfsStP2ltL+CZOKFO0xPx+7VmoMrMU8gAG
	iQBLYWYrf0J+kGFUmLj1zCi0NtJnaNNjTWATpD7LqWmOXHDQUjHF8vrZZQZE+JVAziH4BLG9wLb
	tm7sPbBhWXF//13YpuEKzewTIBcaWjmBylU65lNv5mT5a7U0MlVagLHuguII3sITsxVvVX1T0+U
	nU5QBNFnmHhQW+mo0o+O8o2o+QB4UKqSUB5CVdn45Uof7hQBfuoo7Dp+MCzJD/STOpwSWP8Bjqn
	O1UEhbMk+Zp2yYJhksBcD6j/81BaFACf33lJwEEM/L8KugktmUtID9312NehCkpb8MBU8CCbgEw
	0b0Qv6Hsp1jwYB2CtyePBNyz/NyEao7bXm5C/sqCUsZ912p54Mj2oTS4XRPE8P/BwwyO0QwlT7n
	KNe+lO8wRFLdaUWBf6XLd27Da+vWs=
X-Received: by 2002:a05:7301:508e:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37686173309mr6512778eec.27.1794502165623;
        Thu, 12 Nov 2026 08:49:25 -0800 (PST)
X-Received: by 2002:a05:7301:508e:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37686173309mr6512748eec.27.1794502164967;
        Thu, 12 Nov 2026 08:49:24 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37924f90f16sm850570eec.7.2026.11.12.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:49:24 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, P Praneesh <quic_ppranees@quicinc.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260313094852.3716715-1-arnd@kernel.org>
References: <20260313094852.3716715-1-arnd@kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fix QCOM_RPROC_COMMON dependency
Message-Id: <179450216411.3069467.7160661678626083545.b4-ty@b4>
Date: Thu, 12 Nov 2026 08:49:24 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfXyA4wzGCHMoUp
 tLL78xf4BMSmH5IrM8eXTcbzPWW8eKCPynNTIQDq4VwiEEakKeS4KyXEO3TlS18OF/A3wz13bC9
 isnB8d2EdVb44eSbnBdFSlUBZFpw3c0=
X-Proofpoint-GUID: qDo8o0cA9x8FJ6KnqeAxRZtq5CFiARLp
X-Proofpoint-ORIG-GUID: qDo8o0cA9x8FJ6KnqeAxRZtq5CFiARLp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX926EdULbGgjW
 IrT9BsDIinHSKt+lJpGu+wiw80A/snwSXRKDDfwr1pfxOgmerLQ7mYSwBvGdmC43GrydVG4SDOV
 rXk8DA+70bKbsiwkkPOuXzkkXNKAywrkceZ/NEz3IDwc0BoXTemKFQt/3QsomTilKIdsPqPcdyJ
 1Y4cxgYZvuCBHp8xHh05Nxk8AibHAbjg7csIPHnPQLS4qxtHLK1Iifzh989jJIAgYEJrGyLkjqs
 hnhcH28TtyEX6+RSqRYLKAuKskD2YHNsgMzGDLba/9aTxGK1H6TeQjaCT77wqwmy1HJIvmcfKI6
 mj18BaoxUsvo4fmgmmLt60pwwlCnzD2pahhwf9JEUoR1mDwu8RuC9XJqIHu7KE/Q/TgRClLyYnN
 EuA051VGZttmxIO/Lvx7hrW+W8tMH3WqXO0M7z1cVdtSW2QqftuY4b7JzXC5A9fJM/ny5NKRT00
 qExX7doBSyXXJZcOsYA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5ee16 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=R66U1AtMWxEI_q0A12oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_084927_571719_558AD96C 
X-CRM114-Status: UNSURE (   9.02  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 13 Mar 2026 10:48:43 +0100, Arnd Bergmann wrote:
> The AHB driver depends on the remoteproc interface, which could
> be in a loadable module when ath12k itself is built-in:
> 
> arm-linux-gnueabi-ld: drivers/net/wireless/ath/ath12k/ahb.o: in function `ath12k_ahb_probe':
> ahb.c:(.text+0xb2c): undefined reference to `qcom_register_ssr_notifier'
> arm-linux-gnueabi-ld: ahb.c:(.text+0x1000): undefined reference to `qcom_unregister_ssr_notifier'
> arm-linux-gnueabi-ld: drivers/net/wireless/ath/ath12k/ahb.o: in function `ath12k_ahb_remove':
> ahb.c:(.text+0x1146): undefined reference to `qcom_unregister_ssr_notifier'
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix QCOM_RPROC_COMMON dependency
      commit: f8534946346ef1d5a9899b933013d7438d6a0dc8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


