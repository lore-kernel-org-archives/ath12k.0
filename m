Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E7BC4450A
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 18:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5rGi/DdviKjAvU7tgHrvc/byDs8bfgUehxEkcVWHEU=; b=KHUxYZC3N5OlIo6U/JESqyvlV0
	ZyHT6pWCJrPz1UAMTlKI7x47lY/OlQJpP3azE4/GOSDR/+qUWF5VpMZusBCDuTg2xpkgbAWijLMpq
	06SWJVhWGvl8SCKcbuVGGPWLGvLR5ikUW4KenQzYHOHDFIhZVGCpJsOf6V2mtEODbl8YenknSQjBS
	er/rZZwWZ08ILhWnlymWFD33AGjtHsyQfQble1Wys2rNjzr8up0qAXwUcsZcsHZb2GnCdzXcq6F2m
	itq4LrJYI5v4kPhRzK2wwJBwQQcmqwe8lCnkapaAsrNFHhBgiBE3aqnUeS8gXAgZvwMdVtPRbsXve
	DTxvFPpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhY0-0000000Cq7G-08m9;
	Tue, 14 Jul 2026 18:08:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhXx-0000000Cq66-0qUQ
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 18:07:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EHAfVA1177007
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o5rGi/DdviKjAvU7tgHrvc/byDs8bfgUehxEkcVWHEU=; b=QKMbdXmBND2UqqkU
	2mg2qFon7SZdnXUT7PYjvnz54PaF2cvE1tmV82DT7Mfm0wiOKOaH+8W7fd4LwgXP
	FKo6U3WLV8xyIJgkFwiT5cRgePHSR3Z6LvH459MdQpmUF9GgD9tdoiL0IULTx+hf
	FgG1XT8pzmlaaOXdHJiJlff3UvsNbnDNAaTv9OsAMcDP2G46nfOnmBI6n7wpOzlS
	IC+VKi1Z8HxdNqBLqVu0fTuhfemPiseCGGuVpFVzV55L3J/GOk+pKEXIAXUZqW9c
	2nOz5B1mi03fh7R9NahTBldDRWVKjqHeBmfOZCwGOXnNzywe00RI+F1BckpyBkJJ
	D79JvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9kr6n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:07:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e52306621so607661885a.1
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 11:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052476; x=1784657276; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5rGi/DdviKjAvU7tgHrvc/byDs8bfgUehxEkcVWHEU=;
        b=e99Ij6qMNU+xkuAYBmWsxUUxFkjF9Ng670Sue+M5r2U0wF8zDiYbigY/H6rOMqmw50
         NqeSd1J4EgHnaLZvBWI2MB8gHOD2D3Uf3FKKhHu+Km6sz9cYpIs4xHg5lf5FDfae2RJt
         IDz0iXyKtNhrJd0kgw9GmZvp4/iWv7mgmxiFzKMlY2MiQaOG2x2Rts+YUVi8V6PF0tD3
         HkC4LJuyfeJQbdlUTemC7ots5soJ7eJ8qar7SYrUmd7B+9D5o4iVtasM4XPU8Rng0azh
         QGLLlCbtOoaU4BJOw1fB8L0JNBHi7TSqrkrQBE1sfQYl/q7DP/EtlSJe075T2cev6A4m
         d6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052476; x=1784657276;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5rGi/DdviKjAvU7tgHrvc/byDs8bfgUehxEkcVWHEU=;
        b=aA9HOGyz2sdTB0VYmOKdWM3zS8J0tens6QhPbX+ly2DB0K/yY986ByRarWtF2+Qk40
         b+6e332a946KSVWHo5V+FhvdsFt04Ix0RhImeWHAh6sdaR/pKHLzCdLfs9OIii8AtO/t
         DTifyUkKj66vPZMrdR+2ZlfumCefp39cvBucerY/jElYJ0dY8VIWdE4Nc2JR9DOhcq3o
         bdKMLO5QID+7gQ7wRzq3eRIRlDVG88h9RhKjkXf8vNn44NZ8vrWHxJ9qdzw+JqEC3G/l
         nq7aqiLb3oSar5gAjdGRWj+c6whXFNfRQPDuMvdB7pfj/duxnbKx0wfTKalG2IQPDFkv
         Li6Q==
X-Gm-Message-State: AOJu0Yw6HEh8hkWESL1tUYALPDSEOm/vuWULBfKnSAC/UyDVYVaLWVGW
	mK5uGlOU2IKiMXWVdtTLuhj0zSU/x/6gpTHutlUFIJq2UJTaLfMWcIr26+GRuQAk2bV8JklKRhR
	vy5JkD5AMiRi4vFYQZy9aS8oSMLVBcQzr2t/0cYTi11CEeLlfkCu7ij+VZfEANL1DFganThKi
X-Gm-Gg: AfdE7cknFtPcufKpAJD5YoyFj+3DrDgjbdeosBxrdLj3+/N+7TvVl/l0M+NYdlfTkqJ
	ASJo7+NVDvzrT5xekdeOGf5l3gVMtYr78c8yMPQYMhMHkVCjbSdaud4sulziJKC9lpjO3tU1YAI
	dihOFQxe6p8WMMQCCx8XGrAAc7RqAxmZMFc2EG1Y6e4TJs+70f0N86C4gjAeR4ijdqfKqwYOBwF
	g/kMJdmbLD7iSp+cEux0a5hHwSFtv9F+A2YZiOjWVWnzrly3wB0jex/XWO0/qN3k2Ypp2lHc3AA
	7oZV0sgGLut5pFc2lSZ20lc4vnCYdE2nBmBQ5G4BJFNc6kX8Etwf8YoguAMbjXzgfKN6x6R5F/T
	ze+qzlCnzBeDbUBjHV4H8dCWoiNu5H7i1BU5Tk6ljjPr01yhAulqxkiI+/Pttp1Qd6A==
X-Received: by 2002:a05:620a:170d:b0:92e:6fb0:e79a with SMTP id af79cd13be357-9308683bd50mr330622685a.2.1784052475716;
        Tue, 14 Jul 2026 11:07:55 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:92e:6fb0:e79a with SMTP id af79cd13be357-9308683bd50mr330617085a.2.1784052475004;
        Tue, 14 Jul 2026 11:07:55 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:07:54 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Wei Zhang <wei.zhang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260629061529.1993932-1-wei.zhang@oss.qualcomm.com>
References: <20260629061529.1993932-1-wei.zhang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix rx_mpdu_start layout for
 QCC2072
Message-Id: <178405247365.4102418.16075223393291078104.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:07:53 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a567afc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: dsjFhKb8eXNAwML8S32voxQE4yQrkExk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfX+XcMEUcrAwCV
 rtLyRrFiQPktfLJnFOmTZFy9FgR/Kw80pYCaeT1d4/62z05DwgUuVFbav3gU1bkBUhhlXPLnS+a
 WMgz+7RHMeHhVzMCi1npk6dmTp4pwDI=
X-Proofpoint-GUID: dsjFhKb8eXNAwML8S32voxQE4yQrkExk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfX5B/jnnFEo+8D
 nJ5zTNC2tt8EM5whg8kkH8yC8JyTkh/hkfZxcRE36+9RcPM50eNAar26/XZ05NqkDZkV8ZAs08x
 ogOuuvg6iIhzFqyBkYhkIBQO3fDzaFq7OTSA4H0EPtAFsJuAbA6gZLvurjP/9ot1tpcly/CzBnu
 ZEFdGmQSt0p92IYiPnc61ZS1GxW0Usimf/E8vds1FqiGw4eUa2UMvSJuyq33uOIkx9xlHInC6lT
 G7CgtAUsnYvxuTF6/HxOUwk0pT5dsKJOaRUOczmN8RWduPawIMxCQoH2UIsVH2hiXpQI3URL9dC
 NosoUDhx8voUg6pVQR2j2HlKV/cyryPiwNBGEeEuLw862k5H8uMYQwBnTdBqdPMQb2foGcQ/X9l
 7V1IRtCuMwspuDq6uIPlEgfOpSKH62vSsav6IhjipOQwLl9B5E+wnui8t2QVzssJSZsAq298Qe9
 mCSmhmPW9I3QR9DNKyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_110757_363218_308A2EDC 
X-CRM114-Status: UNSURE (   9.76  )
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


On Sun, 28 Jun 2026 23:15:28 -0700, Wei Zhang wrote:
> QCC2072's rx_mpdu_start TLV has a different field layout from QCN9274.
> Reusing struct rx_mpdu_start_qcn9274 in hal_rx_desc_qcc2072 causes the
> RX datapath to read the wrong offsets for info2, info4, pn[] and
> phy_ppdu_id, producing corrupted sequence number, PN, ppdu_id and
> mpdu-info flags (encrypted, fragment, addr2/addr4 valid).
> 
> Add a dedicated struct rx_mpdu_start_qcc2072 that matches the actual
> hardware descriptor layout, and use it in hal_rx_desc_qcc2072.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix rx_mpdu_start layout for QCC2072
      commit: 9eb29fd47595e8128775f8ac57ca671238cb798a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


