Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56E8CD6E61
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 17:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHyhw4d/8lKtqslD5J+ghkn/sF3Pzc6D9/+cR5SsbyQ=; b=OdphgXV/X+3qaUPcHOt+h6zkxc
	9/+m13jCyzwHG+NlUSCUhiqrp+A2uDXTvZnXvZhn2FUWmLmhyyPuAMYrTdP2m5yyMZeY6MMabHVj9
	yd2Gd8yU9Fl3Vn/kpiM5vPySuHyqvi5cxhEYhyAipbLNEbphhTr9uzm2XjmVoXBWLKu8uJLUGEjOK
	qEd7XbmTolOZq9KYehC296jwxz4EjGwd5vcN9JfQRsDLDEv8WRwPmJhuJ0Zf7m3rN3WFws4yUJgPU
	mOlTgQ96ufLO4XlnbXUyjGw+fpHjKDkym46Arjm31/vPYbFkglWqEWnTch88G3YBZkmqU7N7HkwBR
	VDeuKJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60L-0000000BX6O-27EQ;
	Mon, 01 Jun 2026 17:00:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60I-0000000BX1e-0IGa
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 17:00:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651F7ClV3563632
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 17:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHyhw4d/8lKtqslD5J+ghkn/sF3Pzc6D9/+cR5SsbyQ=; b=Gf/33KL56dOGJBWf
	5DKtpCoH52juQZ9WxIX6NiMcL8x0fX9sNUNNNx9nxBBJzWEPZUNoCx4CH2SZuKb/
	Q46SItINduoCFLcq8Iw55ORatCALE+jjMZF1r32lGsqpZhymjgxc1NRocy5yqttI
	KF9D6PphivQJ3QIxlWTtJgPp8TE9cPxewMtBugh/WD951jLT/v3GLIGRDRQicPxg
	VL29Zs1EF/U5SMYJEG9AEkeZrNXO0sIOPadAseD75PckOPhjMtQfPTcrac31gGR7
	5b5xn5/iCJdTcu3VQ5WfwhJfd8DX67qWdnv3LxrFUF+ASPAXFfeZlrfN1W4X/VlY
	/i2b/Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxt4m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 17:00:41 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137dd3a60e8so2178762c88.0
        for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 10:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780333240; x=1780938040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHyhw4d/8lKtqslD5J+ghkn/sF3Pzc6D9/+cR5SsbyQ=;
        b=S5rMQwfrorT2W7F/UVgQNKfkJdPiGrgj2GH3MLSHLeHNVh1ze58fei6zZSOfm48J5U
         8DIKlbPxVW7V+WmRgYpkqHxFem6ALCfGUjNUjYppPR65USsdpgx6euz6Fx1Q68y6i/3i
         MR4HKsvs48WPsRBaTbzEYRLt7nQVnR3d3vc8OxzEYwbNNGDxDHXLCiS/42IdD2raBJCZ
         1UMHr3dYS+rL4KLW2/h+fCe1uxtN8ekf8DjO+2TMWexxHMTCLl4jjUJC9iBg0tjXRrpd
         hpGGPacl9H8tRKcNcAd1zFfCNRjVxey63qnFF2sRDtXLzkogby6JP1/mT8WQmBTMHYWY
         m/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333240; x=1780938040;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHyhw4d/8lKtqslD5J+ghkn/sF3Pzc6D9/+cR5SsbyQ=;
        b=nc+UQnvgs9z9FonQheZtgN2HouFmfEGYfi6Ji+NZXlLWorn8Qp7jwvVx4Zp3UcSIEY
         /vdxR3hM9z7ibWtdv2e2gg+L6oowmk0x2ccLM59X8UADl1zyG/dYESI6jmPMIwH7wSEV
         AU7ivrBGHNnshbqTOYVfWwZygvKOTxJYOGAxHsiIqPI8V8EW+ElC/Sv/WpI2LdGueqHF
         LdXRbYoDzZCqSGJpC58GNhAzzfYcwEqLsIQ1/LDVS6jTjm3acqPzPtosZOxxi8xZf+KO
         wD2rDYJRBhexa9RG//EPZs1oy03TT5y06TO+2LA2Pk9v6+GKIbXHrNkc8lTxvApvd1gY
         7zeQ==
X-Gm-Message-State: AOJu0YxS0o6dbzCR/EBRmfb+uyOlfW+ZXcy0sCG7JXyutQJGcuymZo5d
	uaGBBuKrlxtC5Benkd8Al8/N0fqqHK1viiBWekAJZobtkZCQCyBCzWQfd1FQnQFnM8OfmVAdX8V
	aYCJhHQH+3mrXx1J/JNrtlCgvYADdJcNduGYpxygMYTyp+TnSlSZEfGZa7zrXBqxi
X-Gm-Gg: Acq92OG31yJ41/Ya2pwTK1rVlcORa+SxBw+ZAocz0QjZ2coG+EDyC077SL/4uMiFTXf
	4tu+Ow6KULZY1RcHXz87sDSy3GUY3yz/eSYurMPZOVsAopKfySInenECk70MZBaMFmX5NcJyeB0
	r/ajraN49ArTZ42by61MbNPIMxtaApb0rPzXe1qjq89gp4Khdj+ToitUJKp2LziqAeMCmsnKKQ9
	UE6XPfkfC5a6GG0OEiRBS3uFG5gw94PC9AtsiQc/3i+rI50w6is9GEZHIhaPF6NsekKttergHvE
	lfjMAmbOOOBtQ78ShbHoGKuVWebEYWQ5ZbciTEuGbHliAXBw2WRtzkgbKot4uSBNA0r4+ZEzaSi
	XThCDaBx2ACpqZyrj8vGGavagn8Lxucn4baV8VMJbCCsjFI7KAdsCr9cvm47kgiZaxsUC7Kjw7s
	4kxjnSkOgHHZc=
X-Received: by 2002:a05:7022:671e:b0:134:cf34:b8e0 with SMTP id a92af1059eb24-137d3f184e9mr5378391c88.9.1780333240138;
        Mon, 01 Jun 2026 10:00:40 -0700 (PDT)
X-Received: by 2002:a05:7022:671e:b0:134:cf34:b8e0 with SMTP id a92af1059eb24-137d3f184e9mr5378346c88.9.1780333239512;
        Mon, 01 Jun 2026 10:00:39 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69bdfsm7151625c88.9.2026.06.01.10.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:00:39 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20260522091828.3199584-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20260522091828.3199584-1-maharaja.kennadyrajan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Prevent incorrect vif
 chanctx switch when handling multi-radio contexts
Message-Id: <178033323889.2045173.1791096745771424829.b4-ty@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 10:00:38 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: nxQvieDHEGK7XUDPHUH0iNj3XiA4kAwB
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1dbab9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KrZl9qRX-uZY2yUkPFUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE2OCBTYWx0ZWRfXwpCayOViu61t
 FEGswqVHjxwtXvSljAnvD8blcTldHqmX13HfWwjjcC/5Os6DiRmPR2zUqWR3aOqty4y+IU8Jimr
 unvvcN6APeJ4naKcSOJ3uh32HRIl/nT5Yk9w7eRe27sUEpBWUw5XB36WAcyorxrasim2Gw55Klm
 IWG72OjMuanHbD/7RRV62DsAWRCKmuF0xwkXrAUlRUNtRWB21zxU3aYVEAfIkEIjxNAOPT9zpPO
 gn5wPkhj8b3nrl3CZAeK6EMKhL9ID3/gEsRJY2XAWVtSou/tBFBS8R3TnFiDwZ1FggpAluRzxQj
 IVOM9m/fWciLKEbEQSSFkEcxUhP3m4UrqMUnokzTSl656bkIV9IIYWvmAJG4+KdxwZaGpAwiV/4
 50DDPPGDyQRpH3PAjkkXAJMxazW4/x9eerHCcCmy6KzKJFO5l45eiZGxs4KM7R6jmRgJF1zEhnw
 NIwfVwEuT32R+NOHsvg==
X-Proofpoint-ORIG-GUID: nxQvieDHEGK7XUDPHUH0iNj3XiA4kAwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_100042_252848_546E54F0 
X-CRM114-Status: GOOD (  11.07  )
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


On Fri, 22 May 2026 14:48:28 +0530, Maharaja Kennadyrajan wrote:
> When multiple links switch channel contexts around the same time, mac80211
> may complete CSA for several links together and invoke
> ath12k_mac_op_switch_vif_chanctx() with an array of vifs spanning more than
> one underlying radio in a single-wiphy configuration.
> 
> The driver currently assumes that all entries in the vifs array belong to the
> same radio and derives the radio context from the first element. On multi-radio
> hardware, this can lead to incorrect vdev selection/updates and may corrupt
> driver state when the number of vifs exceeds what a single radio supports.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Prevent incorrect vif chanctx switch when handling multi-radio contexts
      commit: 675aa75bfc29fb18c6e4d58904a91c1d37228217

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


