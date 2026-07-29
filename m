Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F00C54F51
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 15:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIzR5huQxeeXpvJuvDI07yDpu7ARuYqyzKtVILpu/mY=; b=hMg1Jb8tQaD2VKEcucy9Cj3O9G
	IYQxUXgHJtKJDxK3BIsDPkKBUHTOHSHCLg1ufOcbx5m1o6MwbmJEk3mJN+PYgA10MEjSGaZRhbHA3
	Sm7vMvAD8uHkivXmDzvEC5nG4FwGNKrjNGg9KqAm7Dhj0GBz1Ku/IGx4GmiCn3OSexlXwN5JpqX0j
	hABUFWFf9oOOxLQBOALjOqRhg3JGned6BxSRPFhhK2zlruUQ9NvQN+w9fiwEj3LjoR7fswBb/5qN0
	g4AVhDG+1uoMct5lcimq+MBk290JA1kOE/Z2dt72dIU0b2GrsVhbqE3raI/aEsjJF5foycUO/1QIx
	LugIIwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Ug-00000008Rn9-0u7N;
	Wed, 29 Jul 2026 15:46:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Ud-00000008RlD-30p4
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 15:46:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF32KM2357639
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TIzR5huQxeeXpvJuvDI07yDpu7ARuYqyzKtVILpu/mY=; b=j3ClpX3ZXN+9pdvL
	RAqJsAHVGoLCndYJIc6+2KNWXLUchYx8SA5EkdOd8f2UdLXhMuT1BSclfGFhyJ7S
	qdDiq8SClJsLez0xyggArAyUNAwak8aXNIEBuVwOJ0Xzh2uVGJwt0gAe0y6Nsfde
	zXKseC+6wjsWg4rqO4f94bXidCqg96Q2SPOmEgYLS527kEMinRBQzflRlTGng6De
	X7GkVPQcPJ/0+nvviFm722FVTgKI2kYCA3P7PWieMrdAC6TqofhYfFC7F028M8qg
	GpL0lXjXtbSoHNAw4JIDv0+I2ZhLgoKq/mk87X+9/wQ+5IPWgKrK5c6GGCscE0vT
	WBXzAQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhe993bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so23729705ad.2
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340011; x=1785944811; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIzR5huQxeeXpvJuvDI07yDpu7ARuYqyzKtVILpu/mY=;
        b=QElhOPfcRIUnYdwEFYsXXEVi2zxNWFroCB8Dg6AN1rtXva3NoW1ZvM+4LfCZyRGm7t
         EVKWhCadjcLEJ2PUWhr/FGzFaU3wArP9gEBcIjqUguIYvb6JUeWo9l4H3nRrK2V7b1/A
         DuAbflWNY8ZHAVL3hKqW/jBIfz6BiRdGTv79ZnjTurMZdEPCRXLPSVpq1zWdxoPjwtCL
         Wczc++DGBOTPeUUnkFbykr+ujquTLWrsp0qzz208I/t3MEiD40b1A7qUAMrx0W3X1yem
         wKY90G18K4crLzaF1ABPpauaFjwqb5y5V3r2HXxIxpdOC8shV2dP1jbEbv+UrOeT91mH
         qACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340011; x=1785944811;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TIzR5huQxeeXpvJuvDI07yDpu7ARuYqyzKtVILpu/mY=;
        b=tTMvxxKG5laOktTgo+mpUmXg7wUZRFfUwMdnINGumwC74Q3c83OBEkXnucAp3gOR54
         8V3uv9JHE1bTdUSyB9syO3oHG8AWQ8IFwT1UN5hysh4Km8/zpj0RTj0JOZe93Qv/DPgs
         shAozMiavs8MoLETN/7Uzs0dyo1YCS3oobEmHHkhkLG4fPNCTY787yjTTlMeRVYR+TDc
         Pv5uQy5gnPuwdHC/WIXUfboir6QSZ5lTukhkHJLWDpJpV9EsX2UN6Q7HEoQOKN8jbXXG
         iN6u8Jpg2RPsTElytv+bBKSdUMIuo0WzrXOZ40OK5Xl4b5dAw8BaLYzqJ2lxhS6dJjoO
         KGQQ==
X-Gm-Message-State: AOJu0Yz1PukHmicmHgsIuAlKifDbi0CGrApzs33Tf9C2nkaIWCfmNreD
	G7ViMLrpBoZbriaTR6X11ClKUxuClFsHpXG2N8o6gOpaS0yzSYmtPkKlCsMGQRyxyJQ7b1gJDQR
	mRnXSDAgh7KtgZxsabmG2Ri2gQATgZo3NZaUs94/8O26MyQRYyCf58xU3ONvxarlc
X-Gm-Gg: AR+sD11YsHFY7kjnpR7NhyHLWV73V6v2gUAH97UTTsawth5LEzhWHQY/Wa7lY7zjZme
	O9h6lt4Q0Rz/igm6q4qorF0GOzoRygvdgcBm/o5JvNX4CjCGFhaGNc/hshnKVG0dpaFI+oh7j08
	rAuJsXExeL/8VZoIW/HirBxXXPdMhyzsJSKq7BKnvwAmd+0EKSEm65yXQ2RvWX9X+/9p1QrbUhV
	a23lZGmBUVXOE1JFxrw/tdq7Nss1RG5p3Y/JDJUTnVqv7hpCHuOHAFdtx4qSlHOBJbFp/y88M/M
	oEf2jO2M/IW8404OEAVllT9NyUlMAHXyt0XDMDBjLzHO4DXBDAFCz77tUAv2ET5tnzqTSIdRLbc
	bEfohEEX2vxtKBvTVl+vWWRWP6s37OlBitWc8KihAOp77oTD08Iw2CN8=
X-Received: by 2002:a17:903:1ae4:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2d015c2ab52mr86647755ad.16.1785340010596;
        Wed, 29 Jul 2026 08:46:50 -0700 (PDT)
X-Received: by 2002:a17:903:1ae4:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2d015c2ab52mr86647495ad.16.1785340010193;
        Wed, 29 Jul 2026 08:46:50 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a76a5bsm13577185ad.35.2026.07.29.08.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:46:49 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260721065038.126046-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260721065038.126046-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: add MultiPD support for AHB
 platforms
Message-Id: <178534000893.2826154.6954370843674398249.b4-ty@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:46:48 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfX5AO4iQ2xBdDO
 7mNGYR4xG+5ys2CVVYR7tKOxeGP1QQW0ptKwQ8kiyI0OhBYf0vWt3wcIEsbPFezk+WGBQJmt9Ct
 s1/xLDvf9Joa9sXEuOe8O/yIqC8X9PcFFlZ9aI/KKpMbtvzVuweq6E7Iihg35GRmQOAZ3aIfulR
 RHD3/RCf2MnA56O6UhiVFiF4of0thOnKpFCGYir+TtVp6/wsJaY1Mwp8ryhbEFSL93TyfR5cefd
 XLuKXyqBOWBa9Lo/eiN18ITTmUfuOw6U7GLxQ9FQFDWGoNeXwWt3eGynGEW3gbdFvizP4n7iE9v
 5hoNNGSz+mQaoC5SkRWztmvTaUa9S6cFKP7Ij9XBnxfMBw9RN6U380uJtkHAQpmuZxb+aGMj7vu
 GAEDF+WsXYw934o1YVuSM+njocC85X00WJaq5WKwTs2+j3M76fSaf6XyD3uQKx9lWXIM7MvsqPv
 KL2doq/kG+JpNZRbSNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfX2XVRY/eZ7+RN
 in8B6ozaCnt4/pU8KFpbg8nwnrjR2WVPA/G4cfYQD67S9vXcnd2n3IVXj6nRwV7u6THAqeH6TzG
 75FYnzpLfmNh5rv/80VUfKISmqtfPGY=
X-Proofpoint-ORIG-GUID: Clyha92zQXqWCnmCxhHChWqug1nJF8nA
X-Proofpoint-GUID: Clyha92zQXqWCnmCxhHChWqug1nJF8nA
X-Authority-Analysis: v=2.4 cv=EsriaycA c=1 sm=1 tr=0 ts=6a6a206b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=d9bybJ0-G2pII4xQ70gA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_084651_763858_F023CE4B 
X-CRM114-Status: GOOD (  10.58  )
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


On Tue, 21 Jul 2026 12:20:36 +0530, Aaradhana Sahu wrote:
> On AHB-based MultiPD platforms, multiple UserPDs can share a common
> RootPD. Each UserPD requires its own firmware image and PASID, while
> RootPD resources and services are shared across all UserPDs.
> Add the required infrastructure in ath12k AHB to support MultiPD
> platforms.
> 
> The first patch introduces a platform descriptor to keep
> platform-specific configuration in one place and provide userPD
> mapping support.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: add AHB platform descriptor support
      commit: 96f46607bbcee8aac00c4b5a1213b7d82ceee36d
[2/2] wifi: ath12k: Share RootPD state across UserPDs to avoid duplicate operations
      commit: c6ab3b1dfa3e62dbf42c66121037de460a182642

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


