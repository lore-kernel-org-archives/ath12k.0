Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CC1C83F1A
	for <ath12k@archiver.kernel.org>; Mon, 21 Jul 2025 16:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbhR7wgqAsdiZEMYBFwiyXJ6Odxv1EybtfjmhHzvafw=; b=hR8Jf+iu89j5eBuhidzMN0cATs
	uTtvNk74J6yjvi6Yf5lKGCMVSBFpJyR2d8LXQCO8sL5e5SZ//t26AG01YoyyO8b8il1DGhf5QM7zx
	jQQlngf/Fx8oswt5koK9w1APM5qqPtIU71HqelnooDw90Onnv0OyCibq57T7r3DifdZWppPlI3x4t
	dStoqVX9PaD3+U+QUp1+0fm9UtKCOSwSFujNV6HbmF+Kini2XDf8Ijt+fNyNlf4SEKX1f44bKmKXo
	HTotjnMaN+Nld4J1g7naUN/EuCkg86bpjACEl+R5TnN7Px0o+Edn/IdmQ32M4f8T7Zo/M1boSzFO0
	iPlcuJsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtfx-00000000EAH-0GRY;
	Mon, 21 Jul 2025 16:47:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uds1W-000000001me-1CMI
	for ath12k@lists.infradead.org;
	Mon, 21 Jul 2025 15:01:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L9fnE8029355
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 15:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KbhR7wgqAsdiZEMYBFwiyXJ6Odxv1EybtfjmhHzvafw=; b=U+ZA1H2TS/RL4aUm
	Lhxtrhcu3PfqknEGdYgI3QpMTr+O6n5XaOo0FL67UlrnbOxMQLu4SGffo15W3PpI
	s6KgEYtuQ+xejOKlUR9k7AinopvPt2RMzlWyoG9RsgmRaTycj0IcPqTq1cmJ+JQ6
	ZTU+P5VlmVRDhqdNBZTO9bxN+XjkA2LMEMX4TDv+vJ1W6MyAaHaUf/mOKnGNDbit
	BMBkoNuDDhTr6JynGLGridMPrI0pzIopDoINWpr/E+xYTAKBJ3sezRpDzCuFPWwh
	RHjlehTB8C3QTM7j51eZ1k4GTM13lBDs0S/dGH1H2+2XFM1z70FQGnr/SJRxzH8h
	dvou/w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048tdpbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 15:01:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7494999de28so5896211b3a.1
        for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 08:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753110107; x=1753714907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbhR7wgqAsdiZEMYBFwiyXJ6Odxv1EybtfjmhHzvafw=;
        b=nAzfCHTQprpndmSVEpf4B2WwFttOxxTPfrfFH+L4yK9EWBLD98YcDJvmZpR0B/AReF
         rQXhNDNItWWbPCwZHKusrZN2lWEW856FSlZBC81W+ebQbhsBp9kyuBwYrpgrdTxQ/yHA
         ozM57gvwgZda1EmSkPbR9Ntb/2DcbCZR4+z2Lug5yI4bQ7xZ2M4exQo8CbpQtAE4ZTi/
         4/IHkAnF25MTYdGHCFzvaQH1OXuZR3z6DSyO1VtwwQDNiRe62Pg+rincRsp0dxXgF5kz
         lRobMn/raAUwzS3gDdHge+uWmOABy+t7tGL2qp8aIqQ/5IRmzdhVQ4gW/IGUcHGpeDPd
         PPqw==
X-Forwarded-Encrypted: i=1; AJvYcCX8wgnB889JkvRFtzGYuef8XBV4HA9Tyjbvby0BOkkZav4JiUWw1e7DvMJWB+8egaNhSgqduj8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFMyuIN3bMgtJDSL+hVuB5mPyD/Bk85+zsET+OPojEfB7I/i48
	N5Y3hxNI0+4RbjTxj35IKhTrFK+w9r++V2R4KsGZK/h4K+c6U/3XBlXg1LQwsY8fciD6i5Aen1X
	ALfxuMBHToQ2tBW4Em2UWoxR/EYJeNd3azLBr8wUy5dxAU+1gkPJ4r8t8F0cVZFvifsJA76TC
X-Gm-Gg: ASbGncuLQ2tA/G3DfUk7hi2g4npSOKZy65tGAhLwE2vRM5cJWTxkj0AP1Rp0gcf0wjG
	bcxZDCLvHAxIoAuikKbe+EkSo1PC/HpLGddi+YFVKcAKOAupYMBkzWKz09xgpyMxYrUDMIPrqb8
	LFsewCn+xwSRW3ZomUU+3Y4qimLAbxrkwKdo8DwLR10SL/n78ExCulHG35c3g56SmIn049xDe0G
	s7/Rza0q/pmhFtlQoEPwcDrljrtI90hALon/leEEnnmGQ/hed5f/FzrqxOHjpPKO2XdmbGVH2VM
	oHoe8WkpO600/u5u+0iekjw86kKc/0B0bQYBP/rPoAhM5kl3PDp9gN3Bo36BRtE+zy0NlyKxc2u
	dwB2HPcSQCc8=
X-Received: by 2002:a05:6a20:6f8b:b0:232:a885:e84e with SMTP id adf61e73a8af0-2390dc2f805mr27535051637.25.1753110106501;
        Mon, 21 Jul 2025 08:01:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOHmWE4iyguDMxAHTPOU1nCRim88f/pJDZPNsYN+kAb9LJOLyI2W/6u92FrBlgWXprwHe4bw==
X-Received: by 2002:a05:6a20:6f8b:b0:232:a885:e84e with SMTP id adf61e73a8af0-2390dc2f805mr27534927637.25.1753110105474;
        Mon, 21 Jul 2025 08:01:45 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.224.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c8eb0e98sm5977496b3a.66.2025.07.21.08.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 08:01:45 -0700 (PDT)
Message-ID: <7ee5f1fe-0d0d-ce10-2e6b-8bc9488289dc@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 20:31:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: bring DFS support back for WCN7850
Content-Language: en-US
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Mihai Moldovan <ionic@ionic.de>
References: <20250721-ath12k-dfs-v1-1-065c31454f91@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250721-ath12k-dfs-v1-1-065c31454f91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEzMyBTYWx0ZWRfX1k53iJVw8ZJD
 /ya0fk4wRH0WrTA68p9OKizJMkpgpsqqDBP7GdzcSAXdfUzApNvzFnBKq8So+zzpUvyQQUK8AHz
 uEMKyvdaFHORQ9aGQ40/l/XX2joAzmC7ENef4UR7r6abqf/W3H/ie638DN85SgY7owzdZGxvKKe
 496YaIwFoVpVZKjrP5at4CntIr1ynEub5VsngCiOqEs0MJHHmKjnleH7oKAbTT60x6y3i04NM4a
 Dv0QX5/m3qT+Oro1xcFcVwn7SAp5qIz8AGtLOng8CwHqAtLDrlSSIz9m4qrI9O/2Je70bKURfv1
 uBvZjzc79PwdcGMrum9Fvf12HmOb9WFPMNUIwqpgNaxF4+zdjrSy1grkQHi+PQqd4BomyeCoyCR
 P+j7l3faDb3x2YGFln1D3t0DatvMMFFRXDsOfIQGDZcluTtlDMbd6Ehbc8bV2w6xjD07+RTo
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687e565c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=jjkvTE25TcCRIAzKtE2jAA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Mae7F14F_SpBrmaiimsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 2I9PFn3PlcQMT50bJJF-oHEfzbHloaeB
X-Proofpoint-ORIG-GUID: 2I9PFn3PlcQMT50bJJF-oHEfzbHloaeB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_080150_444540_FC08BD69 
X-CRM114-Status: GOOD (  12.01  )
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



On 7/21/2025 7:57 AM, Baochen Qiang wrote:
> Due to the restrict in MAC80211 that DFS (Dynamic Frequency Selection)
> can't be enabled on multiple channels, commit 176f3009ae59 ("wifi: ath12k:
> support 2 channels for single pdev device") removes DFS support in order
> to support 2 channels concurrently, making AP mode not working on DFS
> channels [1].
> 
> Revert portions of that commit to bring DFS back, and add a new
> combination to support 2-channels concurrency. This is valid because the
> MAC80211 restrict works on each individual combination, but does not care
> about them as a whole, as far as DFS is concerned.
> 
> This change applies to WCN7850 only, other chips are not affected.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 176f3009ae59 ("wifi: ath12k: support 2 channels for single pdev device")
> Reported-by: Mihai Moldovan <ionic@ionic.de>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220346 # 1
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

