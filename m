Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547EB60A260D
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2abA4cYc;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l7XBpB57;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DgsdKo+T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=; b=2abA4cYcKTOwZZ
	O2GIK9GyxdNqwPJdCA+0I2LyqgWuk/m+A8QTroaItKjWgLB1rHcHxMMYHArpIwRFV4hhyBf4M5piM
	fv8u+gMDRxFnKwvuSQVFbpGTzqgxneLRZ3AgzO5GKBVQIPxZuvulD10bQK6NsVAWwLm3Go2oINyUI
	2HZDA3aeO+rKyxyXT6Kqy08wr4sVaiZiFyhe9ss8p+vDw7YPe/5AZQu80lYMBr6KfrHnJiAV82g+y
	6zoV3vR01yG6/YJrvDQZYsZYsybLOjV45tnOx4BoQcjE4Opa9Asv02Jz07es9lLYUyBiDP7+330n8
	S2e6KgZ0UVuxG4zi4eEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmi9-00000004Ari-0Rk8;
	Tue, 10 Nov 2026 14:20:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmi6-00000004Ar0-3Rx6
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 14:20:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB9wdX3195927
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 14:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=; b=l7XBpB57foeSGerC
	m5xXsz9xfKW3IDra2zZuwsxdvJkaQ+sMPB3p8LCrhBZTcHvBCSCwRuaGMNY4MCEh
	NyeVGcW1zNS2v/CIMe1i+iuwtlC6KRZgc1a9+WDr+CeB7Aw6+xBkdi6tB8YN3Uhz
	8UsZStqrHjrDSMX3kSDwEVqZSQ2pjvPynMWFSW/vpRtXRMldcfC/wwVEtMjQ0VBR
	WpGANWEThWa5E1yEJguRtPxpNoRUuCUNeVDiUOFyFnsyNWXZoiIn3MO+tjXoB9vQ
	8Vt+wOJxBnrVmVJtiCDnzJRDahla2Dy92Lt95CkpEBRgpKEtZgRO2CfRizsfEdSv
	yTxC0w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03cs3t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 14:20:29 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9984a7eb3ddso1569534241.0
        for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794320429; x=1794925229; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=;
        b=DgsdKo+TL28fwAZjiI/p1iYBH6jFbCUIxF9tweal1TLrmm2Efef/99NwN/MNhNkNjN
         5BA9wRzgOkdQ5MdGGmUPTtJ8Ee+SyI6ykVMjcxXYhSfkdGXI2PHQ7LZ7Ae2ILN67s7es
         TxzM2mEmH6N7IwXlgc8Wtnz/gWPoUZxS2ZJm3d+5dnls0+35DFTm+UX9ZrygbHyCi4HV
         L91iqqIjo8eNxGPuIYUwrACzYDupT186Y7GEecavS0rA9w/0cQbVBo2SPbyogMH8NuyM
         j+K8js9Tq5wwpNDNaF4hp4zII+XnMBVjDGE2wBqvIOCv5L/bEDXjmXyjTJ3TWLcgyUFM
         mPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320429; x=1794925229;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ck5XRRHP22m9X3iNZf5BjNhfI3aiyPXUvxV7zc6dD6Q=;
        b=o6EwUNNqExi8/kUc5HrapBlkTHzes3QyYvy+F+nn8AQoXx05vhbnMZ9+6MKW+S6kat
         bTNOude+YFhcb9JP15ohxRTzDGh8IuvfI5sa9j7qgH2msXkZWuwLinNEDibW6pfvLAhx
         TFiG3eJ0ZBmoL5TC60Kzwl9IAM/RNb0jrJwSjAc9Rhvwb1abl3J3+Jxz2GaDskw8SJBy
         8MdBH67SwYGOpZV0C79FFM4FTKfEVVXNByYTTFd6XYVi18Mx1mCBQgq8d2uXSlRGs7Or
         iBCfcvJlutAyY1GlIvlUtsoidTSZo/0oU84PcFcvP8Hwbm+eLEzjU3sJ95m+lV8Yypfx
         6HGA==
X-Forwarded-Encrypted: i=1; AL+hErHgzy23UfLArwB/emRFZH+w7NwoIcGd9rI+KrK4vDJRgICxN/11lWU3Cpqqx+2O6hKYxBB54to=@lists.infradead.org
X-Gm-Message-State: APuU4Z956KutepElqohv5TyLkCPCrrWg7kVyfLrGK6BLMApI7EyOq+Lc
	2jjGy8Ah7kC0DPi2JjTa1AyXrmFzDdvbsYyIPEZi7jM1OxQmNONtVzYbA1I0UNl+kL4Xw9gOitW
	pr3DT1/jShuC+LSX+QFfaZC4jWhKSsMJEq0rmZiWbsw7OwckNybBQrEYbeVp0s1K3
X-Gm-Gg: AYBFou18kabW6D5mimDn4WGpqpwxo7AsmC4c8gE3RrKYjoD0pEjUwnRVDmQVklpkjW5
	CY9ScploslaNHOTyDUSqq1221SHYsDU6NqbDNfmCCy4HbPivRwHWlL3DkIoF1tW26/h4FhxIt7S
	0SJUJYdxJlsn1AxKVsyGcgCE/uoWHXZ/CxaHXK4bua0m/9hlQGTqSoNnyAYM1vkpkaiwRKcEqJD
	Mekw+vS10kwW0FCsB4KpIpTku+XVq9VLl65yggyLLFluY0EwDm8ipCFPMRngEJrJ+ymm0yD0vMf
	Rt9u8He46An5DQ06W7lNiSJ/yav4SoarO6CCtsqOgh7XfLS1fw/t5VUncVGnyIxJYvo+wLXp/IL
	2R0uuryIO1EMYle48nW2yvwbZRx2XWDpGnKpajTwHhF58sv78yHnlTil5TKcxIexqL2XcJr4m2x
	I0EWhxK8hW/5jNvg==
X-Received: by 2002:a05:6102:e14:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d301b90875mr1015849137.12.1794320428775;
        Tue, 10 Nov 2026 06:20:28 -0800 (PST)
X-Received: by 2002:a05:6102:e14:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d301b90875mr1015820137.12.1794320428242;
        Tue, 10 Nov 2026 06:20:28 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm5242319f8f.44.2026.11.10.06.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:20:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next v5 2/4] net: qrtr: Assign unique node id for
 MHI endpoints
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261104-qrtr-multi-ep-v5-2-4cdb2b4f1920@oss.qualcomm.com>
References: <20261104-qrtr-multi-ep-v5-0-4cdb2b4f1920@oss.qualcomm.com>
 <20261104-qrtr-multi-ep-v5-2-4cdb2b4f1920@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:20:23 +0100
Message-Id: <179432042357.601816.13272349217674070278.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794320425; l=1427;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=pmxqB3moG63ZiXPlatXfrHmi22c4brr8zAmv5UPA8I8=;
 b=3VK4IzgRzDq5+i8kNkOpzL1wcBaSJdMg4/naLLQ7vN/3KPtJH+B1yfG8lIp5w3xiAoLLoYDt3
 ZVuSV7r+yx/CX6B9QgIG7xJ7bIfu+nOZyq4a/C/87nhN4u704Cmn9aw
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Proofpoint-ORIG-GUID: 5-d56UgKYUwIFJ71Ro-CnVb4GP5BqZnm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NyBTYWx0ZWRfX+Q2QOfztbDqA
 Jtn/p9d7AGPw4aXwPUkDM1BZTydSgFcXWcxWnM1nVdCHlzvQtYB+5VdcOLi8ske3e/Rz7IB7CXE
 /62layqSnpCg54Ue5a2fNrpse1y1jdw=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af3282d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=51d02FP0LlRxlB9DzpEA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 5-d56UgKYUwIFJ71Ro-CnVb4GP5BqZnm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NyBTYWx0ZWRfX0F/LbsdR0ql0
 cl2WmsnkLIw+thlmWsGIhd4yh1HItlpgsTNmgk+nX2Pb+6A1THysNkRnBIooeqUa5xZqen3d4iA
 ChWddLec9cMQNavMVzvzNKwtxuF9m6dn41X5GlDG450d/VZb31W7ioCbBiQOPZdQIfVhpXjqdF+
 kxSqNKLTNHIS14w1Ac1EwmQ4qQxqKi75Vn3uKPUgTR9ioX4An6MvLgixWMz8yROt/eDd1+LFWGq
 HAptD9lOO76ggt5Kg6Es0XFI/pifXXn2RB+xMj2PeFZ+aXWlYZ5xZPDPVKsQhCgdJXXTBiOK3vN
 D1ZbP5oc9V3DMsqPuqX1kPJjT8C59lI8s/Ew96oL0ieF0tXf1S/kH4M0Si9fZJyRfH04KKtB67Z
 AgLLDowRekvTBUDukw5i1774Ns/TgVsD1zNZ5O2OV1T2MzEl5gyCxctIC12He5z7TJdj1RXUHwb
 pIvgu/OT2TSTmpomp2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_062030_972949_274EF768 
X-CRM114-Status: GOOD (  15.74  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index efa70b95f8a7..7a59ccf15490 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -11,6 +11,7 @@
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  
> +#include <net/qrtr.h>
>  #include <net/sock.h>
>  
>  #include "qrtr.h"
> @@ -590,6 +591,12 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  	    cb->type != QRTR_TYPE_RESUME_TX)
>  		goto err;
>  
> +	/* Host assigned node ids are not supposed to overlap with
> +	 * remote node ids
> +	 */
> +	if (cb->src_node >= QRTR_NODE_HOST_BASE)
> +		goto err;
> +
This breaks the functionality for QAIC devices, and any V1 packet with
nid >= 0x10000, for two reasons:
 - V1 uses 32-bit node IDs
 - QAIC devices use hw_sernum as the node ID. I am yet to see a device
   with node ID < 0x10000
This causes "invalid ipcrouter packet" error logs to be printed when the
device is advertising its services to the host.
>  	skb_put_data(skb, data + hdrlen, size);
>  
>  	nid = cb->src_node;
> @@ -615,6 +622,8 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  		const struct qrtr_ctrl_pkt *pkt = data + hdrlen;
>  
>  		nid = le32_to_cpu(pkt->server.node);
> +		if (nid >= QRTR_NODE_HOST_BASE)
> +			goto err;
Same concern as above.

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

