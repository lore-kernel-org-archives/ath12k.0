Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EC4CA9EC5
	for <ath12k@archiver.kernel.org>; Tue, 13 Oct 2026 01:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=; b=YfPtzTrD/iAGu3qzbGRIed0mgp
	bDz/qA8RA3ncXVsbhOiHYMWyiK3f1m2sYFezwIk2Ax5DfhyuxkzM0Jh24QNTBFn3yjWvsD8g1v9aG
	0ydGWrEyQrpjboGEXf4N715BJDTooOCfvFSGOFCljscvgU1++oNhXoa87KSQeVPuDm+bkKBUf4XM/
	j2Ihc9yEQTYk8gPSEoIWhkXpWKY31666w10QFjK54XMmK73OsY994ZGYf8Vf8LXbw1EGwk/RgLM1J
	LndjuXSnnnBTjV0M1uyAjK85CfXaEWAm/H/8AADFQgd0vKXcyGfGUPk2TsFN1aCOF7HqWcpmjgHSP
	gOREjs0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGQxw-0000000BjNs-3kis;
	Tue, 13 Oct 2026 01:06:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGQxt-0000000BjMN-0Lwv
	for ath12k@lists.infradead.org;
	Tue, 13 Oct 2026 01:06:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJMqxo3258163
	for <ath12k@lists.infradead.org>; Tue, 13 Oct 2026 01:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=; b=gVvlj4Iyu3w+P5Os
	Qzcj/4L0CUPcGh9gLziBe6aVEphPNK/yHDFPlzFEZW69sz8GRgQu0NaDa8/jrGIL
	2Hzqrd9OOSXctD6DH45CCRkXsk1ZfdGHtfzTIOrQhirjA5/hMtbkRwAxbPBIlXhk
	n1Axv4SFNL/0jD6wyBhQyruqVWaDzf6YWfmmfgAwwzOi8APkGlrJQOVwyc5GUrDD
	gVh14VSoarMFlMdHt53+PbzVMeLxHrZGg05uB3kbzFMBfd76uW7NO+m7ZRqm3HLs
	+fj1C8Jo6IgqR4ulYuHS6Hev8xNWu+i4JHNpeLvyavcDLxvDRRDTgswP5ru3UWbT
	GSV8ag==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq44bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Oct 2026 01:05:59 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-143826c4a13so1349464c88.1
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 18:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791853559; x=1792458359; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=;
        b=dK+wopQQ/h8joSrqJgS4hOWoYmbc7/wbco6cYVzu/E9ldmCNMvrojRjA3Ei8qlhVfy
         mXEL3WdF5XgjCdqhdAsOLubDb1XZJdxK8PPQK7ksWdg114uQnWt6cZJ4BVagK3F8hoiR
         5wDGkdtbeCljUhzUMFO9NMJPwxNzWTrA7AV/Wef36M3PyL5/iMf6Mmsq6m9yzBIgSrDJ
         /abBnCyMglYlgc9ERHK6JUBlGrPhnJJkFxcivfOQLeP2Tf6+jatZX1EUeDIKz8ji8Poe
         PBF8y/dbNLPg+Rj4y3KL9FKd9OsFeD5VBgJfi0yA1Cs5DdkMNeuReR3enTMmVoixTUK6
         LbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853559; x=1792458359;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=;
        b=2XGTMVn+bQREuuC3Q9wpQueEFv5NhZiDHGwxPe8MV53F/mLpkHcDGPLhHDGYyHxps4
         /XpA9L8cuXMy3oWzY6m74puI2HZXvujb5H/leniiP2HHPTMsy71ShOk0TK6hXYKfwNDP
         R/QGr2puI558X6KI+o6/w5G7/jY9nOE0p0W4hqGYdYBfdBfp2mxOC4UbXy8Lw6bErvmA
         9F60bkXnBoaXNl28kaCwPaUC+RHmM6beWiInmyiGEG0iqT1+BEk7L+RySjsZqoET4aTW
         XWC/gurl8Y2zNsk2sh+FCsod2+SejyErRaMJnODahnKwzLCC0DP1ukHEMe2gr+JSQvs6
         xFcQ==
X-Forwarded-Encrypted: i=1; AKwUvByMBXP3lk5uQ+XxgDzyiNhATMBJI5gfJuIol0JpYn8fBd+6cnFgmjUSPY17glQ+47PqAKHH3bI=@lists.infradead.org
X-Gm-Message-State: AFq9FYJlLAj0W5+eAqcw0l9fG509WVWXISg0CEqKUWsnyd3xF8EtOxo9
	gZOV18j9grfBF7u9D4NnR7CZDKhyu7Es/eeA6w5jXtlPDGIXxTf3vN6+3hfu2qW4dCnk++58Z82
	p7h+jQOJdIue/SgWEdXNlpeGE+hiujVNuUhegtW/kR2rjk9lBGGeOJDzvGz3U4YD0
X-Gm-Gg: AYBFou1z0+4yvuCjfQLodyqbPTf4sH938Pq4tFTFVRfRLQx3sPPiNV3B97IO+q8+YZW
	nSUxSq6fi/AZDT651daPVt1MaBLKSma1GUoALDdPwYrg7YsKVbj9F9Z7hn3xXULjOUsiYPjrneK
	hMCin3WVNPekz+2PMrdS5xNxPcjC7zx5BFuO4wqjGe7u9GMTeQHaNLchCPQY0zf5e9mraByjpD8
	YDdVTXjIyhpKj1LI0ib9yoHqbuQjlHnP69GWk3RwXiINW61A59uaej+qriO+IUb0FPeQgnfIMGV
	viy/2ln/ushD51GyCKU6W/wM9NsIsFY1H6oNsldY4gyq1948K7dzrzUFxEE0DhyecdRw2PNVkmt
	hflR3ozfPlt97frk0EJoOBzHg82bZ/kMejkLvEqjWjnPruPPwyWB8il8=
X-Received: by 2002:a05:7022:170a:b0:141:51fa:e609 with SMTP id a92af1059eb24-16a4c33923emr14320900c88.0.1791853558854;
        Mon, 12 Oct 2026 18:05:58 -0700 (PDT)
X-Received: by 2002:a05:7022:170a:b0:141:51fa:e609 with SMTP id a92af1059eb24-16a4c33923emr14320852c88.0.1791853558074;
        Mon, 12 Oct 2026 18:05:58 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm32904080c88.21.2026.10.12.18.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:05:57 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>,
        Michal Kazior <michal.kazior@tieto.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Bhagavathi Perumal S <bperumal@codeaurora.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
References: <20261003092104.520135-1-yaojiale02@163.com>
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
Message-Id: <179185355715.3481009.13105817063716132761.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:05:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acd83f7 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Op5QjlldpLrGc0l9b0wA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAwNCBTYWx0ZWRfX8XMO/A2pRi4V
 8f2DvCdUAb4OKH0AMIBa9X+yDsgbTST6MvwJuHNiQAMFQx4YlOsgy7qAhPhfLHADX6FGB9dYI7x
 AJvBqeRHdnWnFSgo4+exeQH44aO+d2k=
X-Proofpoint-GUID: ZoS5uMUbApQqKDz7ecD-P9oL4OV_vV_c
X-Proofpoint-ORIG-GUID: ZoS5uMUbApQqKDz7ecD-P9oL4OV_vV_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAwNCBTYWx0ZWRfX4eBxzTzody+L
 FUF2fENvl/srAC8i3BhynLZ/EQGbm1tT7FkDnXpDFIR4+hPRnMljTBBwxHicSYn2xD5a1LEjYMw
 O9hGyzX15yAgysa7ajK52FYM2N/Bki9MrmmEGE4+yh54QVFwz6wuIH37oh4JAZS2jZi4evqfw4O
 3rbchNT+8d4PO4EDQY5z2u0ffHgKNR9DiUttQ6VAQoe94MmKCVdZULnLThcuwQBV3Efp10oe+jo
 ZzraVihDBz+NKp4gzCEhilU8eycJUrI+pntHbyPBQfHhaE99PAUjDomdY03n3WWnLefnSickrvs
 jdemSsq82B3H7GQnmAW4YNJsOkBdlxGYp0uPlgMuOeWgUb5R1c2V8G8P2pgt9kkWb5dvXF5DsfO
 FdD1LqW6VVNmI4GFMf2cOjJwaGThsvtbKQiaE7ZS9L4RSOhDoxDNH7JP7J6Bu7iLP/oBAgjeQZJ
 kbBVBA5LGKSR6iBN8Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_180601_120812_7ABF0E0C 
X-CRM114-Status: GOOD (  10.46  )
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


On Sat, 03 Oct 2026 17:20:57 +0800, Jiale Yao wrote:
> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
> the current entry. idr_for_each() retains radix-tree iterator state across
> the callback, so that removal can invalidate the walk.
> 
> Use idr_for_each_entry() in each cleanup path. It performs a fresh
> idr_get_next() lookup for every iteration, allowing the current entry to
> be removed safely before its skb is released. Keeping the existing locked
> removal helpers also ensures that a concurrent TX completion cannot find
> an IDR entry which points to an already freed skb.
> 
> [...]

Applied, thanks!

[1/5] wifi: ath10k: avoid IDR mutation during TX cleanup
      commit: 1c1a208e65a08191901cfded3bbccc4a54e4a75c
[2/5] wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
      commit: 3e7f5d362b2b3a21b3adb4b860aad14b69a896ad
[3/5] wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
      commit: dc29226dada34a6d19af77b4b51e90f8a3a8de34
[4/5] wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
      commit: 94c7b50351fd30e1dfe1b4051197a1445d8547e1
[5/5] wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
      commit: 4aa45334eb23d40bf31c43405daea9b73469f2a6

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


